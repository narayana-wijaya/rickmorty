//
//  EpisodeListViewModel.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 13/04/23.
//

import Foundation

class EpisodeListViewModel: BaseListViewModel<EpisodeModel> {
    var service: EpisodeServiceProtocol
    
    init(_ service: EpisodeServiceProtocol) {
        self.service = service
    }
    
    override func getData() {
        service.getEpisodeList(endpoint: model?.info.next, search: search ?? "") { [weak self] responseModel in
            guard let self = self else { return }
            self.model = responseModel
            self.delegate?.didFinishGetData()
        } onError: { error in
            self.delegate?.didFinishGetData(with: error.localizedDescription)
        }
    }
    
    func itemAt(index: Int) -> EpisodeViewModel {
        return EpisodeViewModel(results[index])
    }
}
