//
//  PersonCellViewModel.swift
//  ModulebankTest
//
//  Created by Savely on 24.03.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import UIKit


protocol PerconCellViewModelDisplayDelegate: class {
    func personCellViewModel(viewModel: PersonCellViewModel, set image: UIImage)
}


class PersonCellViewModel {
    
    weak var displayDelegate: PerconCellViewModelDisplayDelegate?
    
    private var imageStoreService: ImageStoreServiceProtocol
        
    var person: Person
    
    init(person: Person) {
        self.person = person
        
        imageStoreService = DefaultImageStoreService()
        getImageIfNeeded()
    }
    
    func getImageIfNeeded() {
        imageStoreService.fetchImage(for: person.imageLink) { [weak self] (image: UIImage) in
            guard let self = self else { return }
            
            self.person.image = image
            self.displayDelegate?.personCellViewModel(viewModel: self, set: image)
        }
    }
    
    func personName() -> String {
        return person.name
    }
    
    func personGender() -> String {
        return person.gender
    }
    
    func personStatus() -> String {
        return person.status
    }
    
    func personImage() -> UIImage? {
        return person.image
    }
    
}
