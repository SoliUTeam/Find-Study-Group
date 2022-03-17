//
//  MessageViewController.swift
//  Find Study Group
//
//  Created by JungpyoHong on 3/17/22.
//

import Foundation
import Lottie

class MessageViewController: UIViewController {
    private var animationView: AnimationView?
    private var isMessageAvailable: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noMessageAnimation()
    }
    
    private func noMessageAnimation() {
        if !isMessageAvailable {
            animationView = .init(name: "noMessage")
            animationView!.frame = view.bounds
            animationView!.contentMode = .scaleAspectFit
            animationView!.loopMode = .loop
            animationView!.animationSpeed = 0.5
            view.addSubview(animationView!)
            animationView!.play()
        }
    }
}
