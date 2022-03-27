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
    
     var studyDataSource = [StudyModel]()
    private var collectionDataSource: [String] = ["Computer", "Social", "Bio", "Chemistry", "Book", "eSports", "Language"]
    
    init(delegate: StudyViewModelDelegate) {
        self.delegate = delegate
    }
    
    weak var delegate: StudyViewModelDelegate?
    
    //MARK: - TableView Logic
    func numberOfRow() -> Int {
        studyDataSource.count
    }
    
    func populateTestDataFromJson(fileName: String) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
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
    
    //MARK: - CollectionView Logic
    
    func numbersOfCollection() -> Int {
        collectionDataSource.count
    }
    
    func collectionSelect(at index: Int) -> String {
        collectionDataSource[index]
    }
    
    func configureCollectionCell(in collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: StudyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudyCollectionViewCell", for: indexPath) as? StudyCollectionViewCell
        else { fatalError("cannot find cell") }
        cell.configure(title: collectionSelect(at: indexPath.row))
        return cell
    }
    
    func topicFind(for indexPath: IndexPath) -> String {
        collectionDataSource[indexPath.row].lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func fetchRoomByCollection(topics: String) {
        studyDataSource = []
        populateTestDataFromJson(fileName: topics.lowercased())
    }
}
