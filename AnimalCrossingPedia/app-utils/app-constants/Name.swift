//
//  Name.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 04/02/23.
//

import Foundation

struct Name: Codable
{
    let USName: String
    
    enum CodingKeys: String, CodingKey
    {
        case USName = "name-USen"
    }
}
