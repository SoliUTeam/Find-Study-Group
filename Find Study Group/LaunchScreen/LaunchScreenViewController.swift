//
//  LaunchScreenViewController.swift
//  Find Study Group
//
//  Created by JungpyoHong on 3/26/22.
//

import Foundation
import UIKit
import Lottie

class LaunchScreenViewController: UIViewController {
    
    private var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noMessageAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.navigateToHome()
        })
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    private func noMessageAnimation() {
            animationView = .init(name: "together")
            animationView!.frame = view.bounds
            animationView!.contentMode = .scaleAspectFit
            animationView!.loopMode = .playOnce
            animationView!.animationSpeed = 1.5
            view.addSubview(animationView!)
            animationView!.play()
    }
    
    private func navigateToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let homeViewController = storyboard.instantiateViewController(identifier: "study") as? UITabBarController else { return }
        
        
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}
