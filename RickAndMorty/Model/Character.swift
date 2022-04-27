//
//  Character.swift
//  RickAndMorty
//
//  Created by катя on 21.04.2022.
//

import Foundation


struct Character: Decodable {
    let results: [Resultat]?
    
    init(characterData: [String: Any]) {
        let res = characterData["result"] as? [[String: Any]]
        results = Resultat.getResultat(from: res ?? [[:]])
    }
    
    static func getCharacters(from value: Any) -> Character {
        let characterData = value as? [String: Any] ?? [:]
        let results = characterData["result"] as? [String: Any] ?? [:]
        
        return Character(characterData: results)
    }
}

struct Resultat: Decodable {
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let origin: Origin?
    let location: Origin?
    let image: String?
    
    init(characterData: [String: Any]) {
        name = characterData["name"] as? String
        status = characterData["status"] as? String
        species = characterData["species"] as? String
        gender = characterData["gender"] as? String
        origin = Origin.getOrigin(from: characterData["origin"] as? [String: Any] ?? [:])
        location = Origin.getOrigin(from: characterData["location"] as? [String: Any] ?? [:])
        image = characterData["image"] as? String
    }
    
    static func getResultat(from value: [[String: Any]]) -> [Resultat] {
        return value.compactMap { Resultat(characterData: $0) }
    }
    
}

struct Origin: Decodable {
    let name: String?
    
    init(characterData: [String: Any]) {
        name = characterData["name"] as? String
    }
    
    static func getOrigin(from value: [String: Any]) -> Origin {
        Origin(characterData: value)
    }
}



