//
//  NetworkProtocols.swift
//  ModulebankTest
//
//  Created by Savely on 31.03.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import UIKit


protocol PersonTakeNetworkServiceProtocol {
    func getPersons(at page: Int, completionHandler: @escaping (PersonResponseModel) -> ())
}


protocol ImageNetworkServiceProtocol {
    func fetchImage(with link: String, completionHandler: @escaping (UIImage) -> ())
}
