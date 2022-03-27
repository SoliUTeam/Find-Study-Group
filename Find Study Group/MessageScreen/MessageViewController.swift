//
//  MessageViewController.swift
//  Find Study Group
//
//  Created by JungpyoHong on 3/17/22.
//

import Foundation
import Lottie
import SnapKit

class MessageViewController: UIViewController {
    private var animationView: AnimationView?
    private var isMessageAvailable: Bool = false
    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noMessageAnimation()
        setUpNoMessageLabel()
    }
    
    private func noMessageAnimation() {
        if !isMessageAvailable {
            animationView = .init(name: "noMessage")
            animationView!.frame = view.bounds
            animationView!.contentMode = .scaleAspectFit
            animationView!.loopMode = .loop
            animationView!.animationSpeed = 1
            view.addSubview(animationView!)
            animationView!.play()
        }
    }
    
    private func setUpNoMessageLabel() {
        self.view.addSubview(label)

        label.snp.makeConstraints { make in
            make.centerYWithinMargins.equalTo(200)
            make.centerX.equalTo(self.view)
        }
        
        label.text = "Join the Study Room!!"
        label.textAlignment = .center
    }
}
