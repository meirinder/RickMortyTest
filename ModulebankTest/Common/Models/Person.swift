//
//  Person.swift
//  ModulebankTest
//
//  Created by Savely on 24.03.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import UIKit


class Person {
    
    let id: Int
    
    let name: String
    let gender: String
    let status: String
    let imageLink: String
    let species: String?
    let originName: String?
    let locationName: String?
    var image: UIImage?
    
    init(id: Int, name: String, gender: String, status: String, imageLink: String,
         species: String?, originName: String?, locationName: String?, image: UIImage? = nil) {
        
        self.id = id
        self.name = name
        self.gender = gender
        self.status = status
        self.imageLink = imageLink
        self.species = species
        self.originName = originName
        self.locationName = locationName
        self.image = image
    }
}
