//
//  VillagerRouter.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation

class MainVillagerRouter: AnyVillagerRouter
{
    var routeView: VillagerViewController?
    
    static func create() -> AnyVillagerRouter {
        let route = MainVillagerRouter()
        
        var view: AnyVillagerView = VillagerViewController()
        var presenter: AnyVillagerPresenter = VillagerPresenter()
        var interactor: AnyVillagerInteractor = VillagerInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = route
        presenter.view = view
        presenter.interactor = interactor
        
        route.routeView = view as? VillagerViewController
        
        return route
    }

    
}

