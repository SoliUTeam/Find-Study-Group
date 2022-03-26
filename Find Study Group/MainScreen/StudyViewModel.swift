//
//  StudyViewModel.swift
//  Find Study Group
//
//  Created by JungpyoHong on 3/24/22.
//
import UIKit
import Foundation


protocol StudyViewModelDelegate: AnyObject {
    func reload()
}

class StudyViewModel {
    
    private var studyDataSource = [StudyModel]()
    
    init(delegate: StudyViewModelDelegate) {
        self.delegate = delegate
    }
    
    weak var delegate: StudyViewModelDelegate?
    
    func numberOfRow() -> Int {
        studyDataSource.count
    }
    
    func populateTestDataFromJson() {
        if let path = Bundle.main.path(forResource: "studyList", ofType: "json") {
            do {
                let dataJson = try Data(contentsOf: URL(fileURLWithPath: path))
                let jsonDict = try JSONSerialization.jsonObject(with: dataJson, options: .mutableContainers)
                if let jsonResults = jsonDict as? [String: Any],
                   let results = jsonResults["studyList"] as? [[String: Any]] {
                    results.forEach { dict in
                        self.studyDataSource.append(StudyModel(title: dict["title"] as? String ?? "", studyDescription: dict["studyDescription"] as? String ?? "", thumbnail: dict["thumbnail"] as? String ?? "", currentCount: dict["currentCount"] as? Int ?? 0, fullCount: dict["fullCount"] as? Int ?? 0))
                    }

                }
            } catch {
                print(error)
            }
        }
    }
    
    func configureTestCell(in tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        guard let cell: StudyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "StudyTableViewCell") as? StudyTableViewCell
        else { fatalError("not find") }
        let test = studyDataSource[indexPath.row]
        cell.configure(thumbImage: test.thumbnail, title: test.title, description: test.studyDescription, currentCount: test.currentCount, fullCount: test.fullCount)
        return cell
    }
}
