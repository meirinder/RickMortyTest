//
//  ListViewController.swift
//  ModulebankTest
//
//  Created by Savely on 24.03.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import UIKit


class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewModel.navigationTitle()
        
        viewModel.displayDelegate = self
        viewModel.updatePageCell()
    }
}


extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier, for: indexPath) as! PersonTableViewCell
        
        cell.viewModel = viewModel.cellViewModel(forCellAt: indexPath.row)
        cell.refreshDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.cellCount() - 1 {
            self.viewModel.updatePageCell()
        }
    } 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectCell(at: indexPath.row)
    }
}

extension ListViewController: ListViewModelDisplayDelegate {
    
    func listViewModelUpdateCell(viewModel: ListViewModel) {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ListViewController: RefreshableDelegate {
    
    func personTableViewCellRefreshCell(cell: PersonTableViewCell) {
        
        DispatchQueue.main.async {
            guard let indexPath = self.tableView.indexPath(for: cell) else { return }
            
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}
