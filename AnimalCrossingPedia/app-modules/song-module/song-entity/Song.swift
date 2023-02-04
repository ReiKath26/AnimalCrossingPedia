//
//  Song.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 04/02/23.
//

import Foundation

struct Songs: Codable
{
    let id: Int
    let name: Name
    let musicURL: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey
    {
        case id = "id"
        case name = "name"
        case musicURL = "music_uri"
        case imageURL = "image_uri"
    }
}
