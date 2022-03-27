//
//  StudyCollectionViewCell.swift
//  Find Study Group
//
//  Created by JungpyoHong on 3/27/22.
//

import UIKit

class StudyCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var title: UILabel!
    
    func configure(title: String) {
        self.title.text = title
    }
}
