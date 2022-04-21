//
//  Character.swift
//  RickAndMorty
//
//  Created by катя on 21.04.2022.
//

import Foundation


struct Character: Decodable {
    let results: [Result]?
}

struct Result: Decodable {
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let origin: Origin?
    let location: Location?
    let image: String?
}

struct Origin: Decodable {
    let name: String?
}

struct Location: Decodable {
    let name: String?
}


