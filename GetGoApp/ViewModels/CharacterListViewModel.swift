//
//  CharacterListViewModel.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 11/04/23.
//

import Foundation

class CharacterListViewModel: BaseListViewModel<Character> {
    private var service: CharacterServiceProtocol

    var filter = Filter()
    
    init(service: CharacterServiceProtocol) {
        self.service = service
    }
    
    override func getData() {
        service.getCharacterList(endpoint: model?.info.next, filter: filter) { [weak self] responseModel in
            guard let self = self else { return }
            self.model = responseModel
            self.delegate?.didFinishGetData()
        } onError: { error in
            self.delegate?.didFinishGetData(with: error.localizedDescription)
        }
    }
    
    override func search(_ name: String?) {
        model = nil
        filter.name = name
        getData()
    }
    
    func setFilter(_ filter: Filter) {
        model = nil
        self.filter.status = filter.status
        self.filter.species = filter.species
        self.filter.gender = filter.gender
        getData()
    }
    
    func itemAt(index: Int) -> CharacterViewModel {
        return CharacterViewModel(results[index])
    }
}
