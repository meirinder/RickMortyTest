//
//  DetailViewController.swift
//  ModulebankTest
//
//  Created by Savely on 27.07.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        navigationItem.title = viewModel.navigationTitle()

        configureLabels()
    }
    
    private func configureLabels() {
 
        imageView.image = viewModel.personImage()
        nameLabel.text = viewModel.personName()
        locationLabel.text = viewModel.personLocationName()
        originLabel.text = viewModel.personOriginName()
        genderLabel.text = viewModel.personGender()
        statusLabel.text = viewModel.personStatus()
        speciesLabel.text = viewModel.personSpecies()
    }
    
}
