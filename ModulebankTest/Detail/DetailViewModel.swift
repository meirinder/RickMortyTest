//
//  DetailViewModel.swift
//  ModulebankTest
//
//  Created by Savely on 27.07.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import UIKit


class DetailViewModel {
    
    private let person: Person
    
    init(person: Person) {
        self.person = person
    }
    
    func navigationTitle() -> String {
        return "Detail"
    }
    
    func personName() -> String {
        return person.name
    }
    
    func personGender() -> String {
        return person.gender
    }
    func personImage() -> UIImage? {
        return person.image
    }
    
    func personSpecies() -> String? {
        return person.species
    }
    
    func personLocationName() -> String? {
        return person.locationName
    }
    
    func personOriginName() -> String? {
        return person.originName
    }
    
    func personStatus() -> String {
        return person.status
    }
    
}
