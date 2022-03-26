//
//  StudyViewController.swift
//  Find Study Group
//
//  Created by JungpyoHong on 2/16/22.
//

import UIKit

class StudyViewController: UIViewController {

    @IBOutlet private var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
        }
    }
    
    lazy var viewModel = StudyViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.populateTestDataFromJson()
    }
}

extension StudyViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.configureTestCell(in: tableView, for: indexPath)
    }
}

extension StudyViewController: StudyViewModelDelegate {
    func reload() {
        self.tableView.reloadData()
    }
}
