//
//  AllCharacteresViewModel.swift
//  Demon Slayer
//
//  Created by Karina on 12/03/24.
//

import Foundation
import UIKit

class AllCharacteresViewModel {
    
    let service = Service()
    
    var charactersArray: [DataModel] = []
    
    func getCharacters() {
//  func getCharacters(table: UITableView) {
        service.request { result in
            switch result {
            case .success(let data):
                self.charactersArray = data
//                DispatchQueue.main.async {
//                    table.reloadData()
//                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
