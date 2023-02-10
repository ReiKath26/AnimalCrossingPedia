//
//  BugRouter.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation

class BugRouter: AnyBugRouter
{
    var bugView: BugViewController?
    
    
    static func createMainPage() -> AnyBugRouter {
        let route = BugRouter()
        
        var view: AnyBugView = BugViewController()
        var presenter: AnyBugPresenter = BugPresenter()
        var interactor: AnyBugInteractor = BugInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = route
        presenter.view = view
        presenter.interactor = interactor
        
        route.bugView = view as? BugViewController
    
        return route
    }
    
    
}
