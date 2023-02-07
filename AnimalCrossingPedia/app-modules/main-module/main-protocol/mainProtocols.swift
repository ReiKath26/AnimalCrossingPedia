//
//  mainProtocols.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 04/02/23.
//

import Foundation
import UIKit

protocol AnyMainView
{
    var presenter: AnyMainPresenter? {get set}
    
    func update(with data: [menu])
    func update(with error: String)
}

protocol AnyMainInteractor
{
    var presenter: AnyMainPresenter? {get set}
    
    func getIcons()
}

enum FetchError: Error
{
    case failed
}

protocol AnyMainPresenter
{
    var router: AnyMainRouter? {get set}
    var interactor: AnyMainInteractor? {get set}
    var view: AnyMainView? {get set}
    
    func DidFetchAllIcons(with result: Result<menu, Error>)
    
    func showVillagers(navigationController: UINavigationController)
    
    func showBugs(navigationController: UINavigationController)
    
    func showFishes(navigationController: UINavigationController)
    
    func showSongs(navigationController: UINavigationController)
}

typealias EntryPoint = AnyMainView & UIViewController

protocol AnyMainRouter
{
    var entry: EntryPoint? { get }
    static func create() -> AnyMainRouter
    
    func pushVillagerPage(navigationConroller:UINavigationController)
    
    func pushFishPage(navigationConroller:UINavigationController)
    
    func pushBugPage(navigationConroller:UINavigationController)
    
    func pushSongPage(navigationConroller:UINavigationController)
}
