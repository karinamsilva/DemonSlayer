//
//  DataModel.swift
//  Demon Slayer
//
//  Created by Karina on 12/03/24.
//

import Foundation

struct DataModel: Decodable {
    let name: String
    let id: String
    let race: String
    let affiliation: String
    let skill: String
    let quote: String
}
