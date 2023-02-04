//
//  Villager.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 04/02/23.
//

import Foundation

struct Villager: Codable
{
    let id: Int
    let name: Name
    let personality: String
    let birthdayDate: String
    let species: String
    let gender: String
    let catchPhrase: String
    let iconURL: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey
    {
        case id = "id"
        case name = "name"
        case personality = "personality"
        case birthdayDate = "birthday"
        case species = "species"
        case gender = "gender"
        case catchPhrase = "catch-phrase"
        case iconURL = "icon_uri"
        case imageURL = "image_uri"
    }
}
