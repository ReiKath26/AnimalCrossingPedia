//
//  Bugs.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 04/02/23.
//

import Foundation

struct Bugs: Codable
{
    let id: Int
    let name: Name
    let availability: Availability
    let phrase: String
    let price: Int
    let priceFlick: Int
    let imageURI: String
    let iconURI: String
    
    enum CodingKeys: String, CodingKey
    {
        case id = "id"
        case name = "name"
        case availability = "availability"
        case price = "price"
        case priceFlick = "price-flick"
        case phrase = "museum-phrase"
        case imageURI = "image_uri"
        case iconURI = "icon_uri"
    }
}
