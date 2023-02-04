//
//  protocols.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 04/02/23.
//

import Foundation
import UIKit

//view protocol

protocol VillagerMainView
{
    var presenter: AnyPresenter? {get set}
    
    func update(with data: [Villager])
    func update(with error: String)
}


//interactor protocol

protocol AnyInteractor
{
    var presenter: AnyPresenter? {get set}
    
    func getData()
}

//presenter protocol

enum FetchError: Error
{
    case failed
}

protocol AnyPresenter
{
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func DidFetchVillagers(with result: Result<[villager], Error>)
}

//router protocol


typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter
{
    var entry: EntryPoint? { get }
    static func create() -> AnyRouter
}




