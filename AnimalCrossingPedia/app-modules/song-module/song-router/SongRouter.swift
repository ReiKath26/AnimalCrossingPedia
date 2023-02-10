//
//  SongRouter.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation

class SongRouter: AnySongRouter
{
    var songView: SongViewController?
    
    static func create() -> AnySongRouter {
        let route = SongRouter()
        
        var view: AnySongView = SongViewController()
        var presenter: AnySongPresenter = SongPresenter()
        var interactor: AnySongInteractor = SongInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = route
        presenter.view = view
        presenter.interactor = interactor
        
        route.songView = view as? SongViewController
        
        
        return route
    }
    
    
    
}
