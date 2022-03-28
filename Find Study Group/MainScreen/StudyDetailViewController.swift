//
//  StudyDetailViewController.swift
//  Find Study Group
//
//  Created by JungpyoHong on 3/27/22.
//

import Foundation
import UIKit

class StudyDetailViewController: UIViewController {
    
    @IBOutlet private weak var image: UIImageView!{
        didSet {
            self.image.layer.opacity = 0.5
            self.image.image = UIImage(named: studyDataSource?.thumbnail ?? "example")
        }
    }
    @IBOutlet private weak var studyTitle: UILabel! {
        didSet {
            self.studyTitle.text = studyDataSource?.title
        }
    }
    @IBOutlet private weak var studyDetail: UILabel! {
        didSet {
            self.studyDetail.text = studyDataSource?.studyDescription
        }
    }
    
    @IBOutlet private weak var member: UILabel! {
        didSet {
            self.member.text = "\(studyDataSource?.currentCount ?? 0)/\( studyDataSource?.fullCount ?? 0)"
        }
    }
    
    var studyDataSource: StudyModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationController?.popToViewController(self, animated: animated)
    }
}

extension StudyDetailViewController: StudyViewModelDelegate {
    func reload() {
    }
}
