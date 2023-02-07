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
}

typealias FishPage = AnyFishView & UIViewController

protocol AnyFishRouter
{
    var entry: FishPage? { get }
    static func create() -> AnyFishRouter
}




