//
//  StudyModel.swift
//  Find Study Group
//
//  Created by JungpyoHong on 3/24/22.
//

import Foundation

struct StudyModel: Codable {
    var title: String
    var studyDescription: String
    var thumbnail: String
    var currentCount: Int
    var fullCount: Int
}
