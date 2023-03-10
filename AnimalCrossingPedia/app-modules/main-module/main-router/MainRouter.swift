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
    var entry: MainViewController?
    
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
        
        route.entry = view as? MainViewController
        
        
        return route
    }
    
    func pushVillagerPage(navigationConroller navigationController:UINavigationController)
    {
        let villagerRouter = MainVillagerRouter.create()
        guard let vc = villagerRouter.routeView else {return}
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pushFishPage(navigationConroller navigationController: UINavigationController)
    {
        let fishRouter = FishRouter.create()
        guard let vc = fishRouter.fishView else {return}
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pushBugPage(navigationConroller navigationController: UINavigationController)
    {
        let bugRouter = BugRouter.createMainPage()
        guard let vc = bugRouter.bugView else {return}
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pushSongPage(navigationConroller navigationController: UINavigationController)
    {
        let songRouter = SongRouter.create()
        guard let vc = songRouter.songView else {return}
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}

