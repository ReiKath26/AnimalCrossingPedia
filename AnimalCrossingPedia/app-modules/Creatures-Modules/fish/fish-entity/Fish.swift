//
//  Fish.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 04/02/23.
//

import Foundation

struct Fish: Codable
{
    let id: Int
    let name: Name
    let avail: Availability
    let phrase: String
    let price: Int
    let priceCJ: Int
    let imageURL: String
    let iconURL: String
    
    enum CodingKeys: String, CodingKey
    {
        case id = "id"
        case name = "name"
        case avail = "availability"
        case price = "price"
        case priceCJ = "price-cj"
        case phrase = "museum-phrase"
        case imageURL = "image_uri"
        case iconURL = "icon_uri"
    }
}
