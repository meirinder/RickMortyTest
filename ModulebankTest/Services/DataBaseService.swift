//
//  DataBaseService.swift
//  ModulebankTest
//
//  Created by Savely on 24.03.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import UIKit
import RealmSwift

protocol DataBaseServicePersonReadWriteProtocol {
    func savePersons(persons: [Person])
    func persons() -> [Person]
}

class DataBaseService: DataBaseServicePersonReadWriteProtocol {
    
    private let realm = try! Realm()
    private let queueLabel = "DataBaseServicePersonRealmQueue"
    private let concurrentQueue: DispatchQueue
    
    init() {
        concurrentQueue = DispatchQueue(label: queueLabel, qos: .utility, attributes: .concurrent)
    }
    
    func savePersons(persons: [Person]) {
        let realmPersons = persons.map { (person: Person) -> PersonRealmModel in
            return convertModelToRealm(model: person)
        }
        
        do {
            try realm.write {
                
                realm.deleteAll()
                realm.add(realmPersons)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    func persons() -> [Person] {
        
        concurrentQueue.sync {
            let realmModels = realm.objects(PersonRealmModel.self)
            
            var persons = [Person]()
            
            realmModels.forEach { (realmModel: PersonRealmModel) in
                persons.append(self.convertRealmToModel(realmModel: realmModel))
            }
            
            return persons
        }
    }
    
    private func convertRealmToModel(realmModel: PersonRealmModel) -> Person {
        
        let person = Person(id: realmModel.id,
                      name: realmModel.name,
                      gender: realmModel.gender,
                      status: realmModel.status,
                      imageLink: realmModel.imageLink,
                      image: nil)
        
        if let imageData = realmModel.imageData {
            person.image = UIImage(data: imageData)
        }
        return person
    }
    
    private func convertModelToRealm(model: Person) -> PersonRealmModel {
        
        let realmModel = PersonRealmModel()
        realmModel.gender = model.gender
        realmModel.name = model.name
        realmModel.id = model.id
        realmModel.imageLink = model.imageLink
        realmModel.status = model.status
        realmModel.imageData = model.image?.pngData()
        
        return realmModel
    }
    
}
