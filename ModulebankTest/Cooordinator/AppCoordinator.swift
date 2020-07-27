//
//  AppCoordinator.swift
//  ModulebankTest
//
//  Created by Savely on 27.07.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import UIKit


class AppCoordinator: Coordinatable {
  
  private let navigationController: UINavigationController
  private var coreCoordinator: Coordinatable!
  
  required init(navigationController: UINavigationController) {
    
    self.navigationController = navigationController 
    setUpCoordinators()
  }
    
  func start() {
    showCoreStep()
  }
  
  private func showCoreStep() {
    coreCoordinator.start()
  }
  
  private func setUpCoordinators() {
     coreCoordinator = CoreCoordinator(navigationController: navigationController)
  }
}
