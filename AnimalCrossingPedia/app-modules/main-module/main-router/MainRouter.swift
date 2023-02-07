//
//  MainRouter.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 04/02/23.
//

import Foundation
import UIKit


class MainRouter: AnyMainRouter
{
    var entry: EntryPoint?
    
    static func create() -> AnyMainRouter {
        let route = MainRouter()
        
        var view: AnyMainView = MainViewController()
        var presenter: AnyMainPresenter = MainPresenter()
        var interactor: AnyMainInteractor = MainInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = route
        presenter.view = view
        presenter.interactor = interactor
        
        route.entry = view as? EntryPoint
        
        
        return route
    }
    
    func pushVillagerPage(navigationConroller:UINavigationController)
    {
        let villagerRouter = MainVillagerRouter.create()
        guard let vc = villagerRouter.entry else {return}
        navigationConroller.pushViewController(vc, animated: true)
    }
    
    func pushFishPage(navigationController: UINavigationController)
    {
        let fishRouter = FishRouter.create()
        guard let vc = fishRouter.entry else {return}
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pushBugPage(navigationController: UINavigationController)
    {
        let bugRouter = BugRouter.createMainPage()
        guard let vc = bugRouter.entry else {return}
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pushSongPage(navigationController: UINavigationController)
    {
        let songRouter = SongRouter.create()
        guard let vc = songRouter.entry else {return}
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}

