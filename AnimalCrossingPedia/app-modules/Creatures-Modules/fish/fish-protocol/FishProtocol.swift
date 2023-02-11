//
//  FishProtocol.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//
import Foundation
import UIKit

protocol AnyFishView
{
    var presenter: AnyFishPresenter? {get set}
    
    func update(with data: [Fish])
    func update(with error: String)
}

protocol AnyFishInteractor
{
    var presenter: AnyFishPresenter? {get set}
    
    func getFish()
}

protocol AnyFishPresenter
{
    var router: AnyFishRouter? {get set}
    var interactor: AnyFishInteractor? {get set}
    var view: AnyFishView? {get set}
    
    func DidFetchAllFishes(with result: Result<[Fish], Error>)
    func seeFishDetail(navigationController: UINavigationController, fish: Fish)
}


protocol AnyFishRouter
{
    var fishView: FishViewController? {get }
    static func create() -> AnyFishRouter
    
    func pushDetailPage(navigationConroller navigationController: UINavigationController, fish: Fish)
}




