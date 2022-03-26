//
//  StudyTableViewModel.swift
//  Find Study Group
//
//  Created by JungpyoHong on 3/24/22.
//

import Foundation
import UIKit

protocol StudyTableViewModelProtocol {
    var title: String { get }
    var studyDescription: String { get }
    var thumbnail: String { get }
    var currentCount: Int { get }
    var fullCount: Int { get }
}

class StudyTableViewModel: StudyTableViewModelProtocol {
    
    private let studyModel: StudyModel
    
    init(studyModel: StudyModel) {
        self.studyModel = studyModel
    }
    
    var title: String {
        studyModel.title
    }

    var studyDescription: String {
        studyModel.studyDescription
    }
    
    var thumbnail: String {
        studyModel.thumbnail
    }
    
    var currentCount: Int {
        studyModel.currentCount
    }
    
    var fullCount: Int {
        studyModel.fullCount
    }
}
