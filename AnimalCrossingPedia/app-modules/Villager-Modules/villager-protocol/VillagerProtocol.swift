//
//  VillagerProtocol.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation
import UIKit

protocol AnyVillagerView
{
    var presenter: AnyVillagerPresenter? {get set}
    
    func update(with data: [Villager])
    func update(with error: String)
}

protocol AnyVillagerInteractor
{
    var presenter: AnyVillagerPresenter? {get set}
    
    func getVillagers()
}

protocol AnyVillagerPresenter
{
    var router: AnyVillagerRouter? {get set}
    var interactor: AnyVillagerInteractor? {get set}
    var view: AnyVillagerView? {get set}
    
    func DidFetchVillagers(with result: Result<[Villager], Error>)
}

protocol AnyVillagerRouter
{
    var routeView: VillagerViewController? { get }
    static func create() -> AnyVillagerRouter
}



