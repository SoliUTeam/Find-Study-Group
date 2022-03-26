//
//  StudyTableViewCell.swift
//  Find Study Group
//
//  Created by JungpyoHong on 3/24/22.
//

import Foundation
import UIKit

class StudyTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var thumbImage: UIImageView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var studyDescription: UILabel!
    @IBOutlet private weak var userCount: UILabel!
    
    func configure(thumbImage: String, title: String, description: String, currentCount: Int, fullCount: Int) {
        self.thumbImage.image = UIImage(named: thumbImage)
        self.title.text = title
        self.studyDescription.text = description
        self.userCount.text = "\(currentCount)/\(fullCount)"
    }
}
