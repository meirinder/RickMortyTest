//
//  CoreCoordinator.swift
//  ModulebankTest
//
//  Created by Savely on 27.07.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import UIKit


class CoreCoordinator: Coordinatable {
    
    private let navigationController: UINavigationController
    
    private var listStoryboard: UIStoryboard {
      return UIStoryboard(name: "List", bundle: nil)
    }
    private var detailStoryboard: UIStoryboard {
      return UIStoryboard(name: "Detail", bundle: nil)
    }
    
    required init(navigationController: UINavigationController) {
      self.navigationController = navigationController
    }
    
    func start() {
        showListStep()
    }
    
    private func showDetailStep(with person: Person) {
        guard let viewController = detailStoryboard.instantiateInitialViewController() as? DetailViewController else {
            assertionFailure()
            return
        }
        
        let viewModel = DetailViewModel(person: person)
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showListStep() {
        guard let viewController = listStoryboard.instantiateInitialViewController() as? ListViewController else {
            assertionFailure()
            return
        }
        
        let viewModel = ListViewModel(networkService: NetworkService(), dataBaseService: DataBaseService())
        viewModel.didSelectViewModel = { [weak self] viewModel in
            
            self?.showDetailStep(with: viewModel.person)
        }
        viewController.viewModel = viewModel
        navigationController.setViewControllers([viewController], animated: false)
    }
}
 
