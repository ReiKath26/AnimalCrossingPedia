//
//  FishRouter.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation
import UIKit

class FishRouter: AnyFishRouter
{
    func pushDetailPage(navigationConroller navigationController: UINavigationController, fish: Fish) {
        let vc = FishDetailViewController(nibName: nil, bundle: nil)
        vc.fish = fish
        navigationController.pushViewController(vc, animated: true)
    }
    
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
