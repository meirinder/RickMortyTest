//
//  PersonRealmModel.swift
//  ModulebankTest
//
//  Created by Savely on 24.03.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import UIKit
import RealmSwift


class PersonRealmModel: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var gender: String = ""
    @objc dynamic var status: String = ""
    @objc dynamic var species: String = ""
    @objc dynamic var originName: String = ""
    @objc dynamic var locationName: String = ""
    @objc dynamic var imageLink: String = ""
    @objc dynamic var imageData: Data? = nil
}



