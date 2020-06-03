//
//  NetworkService.swift
//  ModulebankTest
//
//  Created by Savely on 24.03.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import Foundation
import Alamofire


class NetworkService {
    
    private enum Router: String {
        case pagedUrl = "https://rickandmortyapi.com/api/character/?page="
    }
    
    let sessionManager = Session.default
    
    func getPersons(at page: Int, completionHandler: @escaping (PersonResponseModel) -> () ) {
        guard let url = URL(string: Router.pagedUrl.rawValue + "\(page)") else { return }
        
        sessionManager.request(url, method: .get).responseData { (response) in
            
            guard let data = response.data else {
                
                assertionFailure("getPersons - something went wrong")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let resultModel = try decoder.decode(PersonResponseModel.self, from: data)
                completionHandler(resultModel)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
}
