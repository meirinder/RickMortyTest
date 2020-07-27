//
//  PersonResponseModel.swift
//  ModulebankTest
//
//  Created by Savely on 24.03.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import Foundation
 

struct PersonResponseModel: Codable {
    let info: Info?
    let results: [Result]?
    
}


struct Info: Codable {
    let count, pages: Int?
    let next, prev: String?
}


struct Result: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}


struct Location: Codable {
    let name: String?
    let url: String?
}
 
