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
            self.tableView.reloadData()
        }
    }
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        }
    }
    
    lazy var viewModel = StudyViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.populateTestDataFromJson(fileName: "computer")
    }
    
    @IBAction func plusBtnTapped(_ sender: UIButton) {
        
    }
}

// MARK: - Tableview configure
extension StudyViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.configureTestCell(in: tableView, for: indexPath)
    }
}

// MARK: - CollectionView configure
extension StudyViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        viewModel.configureCollectionCell(in: collectionView, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numbersOfCollection()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let topic = viewModel.topicFind(for: indexPath)
            viewModel.fetchRoomByCollection(topics: topic)
        print(viewModel.studyDataSource)
        self.reload()
    }
}

extension StudyViewController: StudyViewModelDelegate {
    func reload() {
        self.tableView.reloadData()
    }
}
