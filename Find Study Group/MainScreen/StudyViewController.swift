//
//  StudyViewController.swift
//  Find Study Group
//
//  Created by JungpyoHong on 2/16/22.
//

import UIKit

class StudyViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension StudyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
