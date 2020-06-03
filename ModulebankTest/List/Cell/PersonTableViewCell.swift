//
//  PersonTableViewCell.swift
//  ModulebankTest
//
//  Created by Savely on 24.03.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import UIKit

protocol RefreshableDelegate: class {
    func personTableViewCellRefreshCell(cell: PersonTableViewCell)
}

class PersonTableViewCell: UITableViewCell {
    
    weak var refreshDelegate: RefreshableDelegate?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.personImageView.image = UIImage(named: "defaultAvatar")
    }
    
    var viewModel: PersonCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            viewModel.displayDelegate = self
            
            
            self.nameLabel.text = viewModel.personName()
            self.statusLabel.text = viewModel.personStatus()
            self.genderLabel.text = viewModel.personGender()
            
            if let image = viewModel.personImage() {
                self.personImageView.image = image
            }
        }
    }
 
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
     
}

extension PersonTableViewCell: PerconCellViewModelDisplayDelegate {
    
    func personCellViewModel(viewModel: PersonCellViewModel, set image: UIImage) {
        refreshDelegate?.personTableViewCellRefreshCell(cell: self)
    }
}
