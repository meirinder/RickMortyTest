//
//  ImageStoreService.swift
//  ModulebankTest
//
//  Created by Savely on 24.03.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import UIKit

protocol ImageStoreServiceProtocol {
    func fetchImage(for link: String, comletionHandler: @escaping (UIImage) -> ())
}

class DefaultImageStoreService: ImageStoreServiceProtocol {
    
    private var networkService: ImageNetworkServiceProtocol
    
    init() {
        networkService = NetworkService()
    }
    
    private var imageCashe = [String: UIImage]()
    
    func fetchImage(for link: String, comletionHandler: @escaping (UIImage) -> ()) {
        
        if let image = imageCashe[link] {
            comletionHandler(image)
            return
        }
        
        networkService.fetchImage(with: link, completionHandler: { [weak self] image in
            guard let self = self else { return }
            
            self.imageCashe[link] = image
            comletionHandler(image)
        })
    }
    
}
