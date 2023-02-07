//
//  SongRouter.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation

class SongRouter: AnySongRouter
{
    
    var entry: SongPage?
    
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
        
        route.entry = view as? SongPage
        
        
        return route
    }
    
    
    
}
