//
//  BaseListViewModel.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 14/04/23.
//

import Foundation

class BaseListViewModel<Model: Decodable> {
    var model: ResponseModel<[Model]>? {
        didSet { updateList() }
    }
    var results: [Model] = []
    var search: String?
    weak var delegate: GetDataDelegate?

    func getData() {}

    func loadMore() {
        guard let model = model, model.info.next != nil else { return }
        getData()
    }

    func search(_ name: String?) {
        model = nil
        search = name
        getData()
    }
}

extension BaseListViewModel {
    func updateList() {
        if let model = model, let result = model.results {
            results.append(contentsOf: result)
        } else {
            results.removeAll()
        }
    }
}
