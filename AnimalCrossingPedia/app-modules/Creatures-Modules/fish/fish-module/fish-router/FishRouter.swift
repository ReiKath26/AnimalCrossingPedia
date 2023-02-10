//
//  FishRouter.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation

class FishRouter: AnyFishRouter
{
    var fishView: FishViewController?
    
    static func create() -> AnyFishRouter {
        let route = FishRouter()
        
        var view: AnyFishView = FishViewController()
        var presenter: AnyFishPresenter = FishPresenter()
        var interactor: AnyFishInteractor = FishInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = route
        presenter.view = view
        presenter.interactor = interactor
        
        route.fishView = view as? FishViewController
        
        
        return route
    }
    
    
}
