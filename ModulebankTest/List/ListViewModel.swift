//
//  ListViewModel.swift
//  ModulebankTest
//
//  Created by Savely on 24.03.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import Foundation


protocol ListViewModelDisplayDelegate: class {
    func listViewModelUpdateCell(viewModel: ListViewModel)
}


class ListViewModel {
    
    weak var displayDelegate: ListViewModelDisplayDelegate?
    
    var didSelectViewModel: ((PersonCellViewModel) -> ())?
    
    private var cellViewModels: [PersonCellViewModel] = []
    private let networkService: PersonTakeNetworkServiceProtocol
    private let dataBaseService: DataBaseServicePersonReadWriteProtocol
    
    private var currentPage = 1

    var cellIdentifier: String {
        return "RickAndMortyCell"
    }
    
    init(networkService: PersonTakeNetworkServiceProtocol,
         dataBaseService: DataBaseServicePersonReadWriteProtocol) {
        
        self.networkService = networkService
        self.dataBaseService = dataBaseService
    }
    
    func updatePageCell() {
        
        let persons = dataBaseService.persons()
        if !persons.isEmpty && currentPage == 1 {
            
            persons.forEach { (person: Person) in
                let personViewModel = PersonCellViewModel(person: person)
                
                cellViewModels.append(personViewModel)
            }
            displayDelegate?.listViewModelUpdateCell(viewModel: self)
            currentPage += 1
            return
        }
        
        
        networkService.getPersons(at: currentPage) { [weak self] (responseModel) in
            guard let self = self else { return }
            
            self.setupCellViewModels(model: responseModel)
            if self.currentPage == 1 {
                let persons = self.takePersons(responseModel: responseModel)
                self.dataBaseService.savePersons(persons: persons)
            }
            self.currentPage += 1
        }
    }
    
    func dispatchLabel() -> String {
        return "updatePageCellLabel"
    }
    
    func cellViewModel(forCellAt index: Int) -> PersonCellViewModel {
        return cellViewModels[index]
    }
    
    func navigationTitle() -> String {
        return "List"
    }
    
    func cellCount() -> Int {
        return cellViewModels.count
    }
    
    func didSelectCell(at index: Int) {
        didSelectViewModel?(cellViewModels[index])
    }
    
    private func setupCellViewModels(model: PersonResponseModel) {
        
        let persons = takePersons(responseModel: model)
        
        persons.forEach({ (person: Person) in
             
            let personViewModel = PersonCellViewModel(person: person)
            
            cellViewModels.append(personViewModel)
        })
        displayDelegate?.listViewModelUpdateCell(viewModel: self)
    }
    
    private func takePersons(responseModel: PersonResponseModel) -> [Person] {
        let results = responseModel.results
        var resultPersons = [Person]()
        
        results?.forEach({ (result: Result) in
            guard let id = result.id,
                let name = result.name,
                let gender = result.gender,
                let status = result.status,
                let imageLink = result.image,
                let species = result.species,
                let originName = result.origin?.name,
                let locationName = result.location?.name else {
                    return
            }
            
            let person = Person(id: id,
                                name: name,
                                gender: gender,
                                status: status,
                                imageLink: imageLink,
                                species: species,
                                originName: originName,
                                locationName: locationName,
                                image: nil)
            
            resultPersons.append(person)
        })
        return resultPersons
    } 
}
 
