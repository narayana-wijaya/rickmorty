//
//  LocationListViewModel.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 13/04/23.
//

import Foundation

class LocationListViewModel: BaseListViewModel<LocationModel> {
    var service: LocationServiceProtocol
    
    init(_ service: LocationServiceProtocol) {
        self.service = service
    }
    
    override func getData() {
        service.getLocationList(endpoint: model?.info.next, search: search ?? "") { [weak self] responseModel in
            guard let self = self else { return }
            self.model = responseModel
            self.delegate?.didFinishGetData()
        } onError: { error in
            self.delegate?.didFinishGetData(with: error.localizedDescription)
        }
    }
    
    func itemAt(index: Int) -> LocationViewModel {
        return LocationViewModel(results[index])
    }
}
