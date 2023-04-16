//
//  ViewModelProtocol.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 12/04/23.
//

import Foundation

protocol GetDataDelegate: AnyObject {
    func didFinishGetData()
    func didFinishGetData(with error: String)
}
