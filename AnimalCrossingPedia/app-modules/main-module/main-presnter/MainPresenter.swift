//
//  MainPresenter.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 06/02/23.
//

import Foundation
import UIKit

class MainPresenter: AnyMainPresenter
{
    var menus: [menu] = []
    var router: AnyMainRouter?
    var interactor: AnyMainInteractor?
    {
        didSet
        {
            interactor?.getIcons()
        }
    }
    var view: AnyMainView?
    
    
    func DidFetchAllIcons(with result: Result<menu, Error>)
    {
        switch result {
        case .success(let m):
            menus.append(m)
            if(menus.count == 4)
            {
                view?.update(with: menus)
            }
        case .failure:
            view?.update(with: "acnh_icon")
        }
    }
    
    func showVillagers(navigationController: UINavigationController)
    {
        router?.pushVillagerPage(navigationConroller: navigationController)
    }
    
    func showBugs(navigationController: UINavigationController)
    {
        router?.pushBugPage(navigationConroller: navigationController)
    }
    
    func showFishes(navigationController: UINavigationController)
    {
        router?.pushFishPage(navigationConroller: navigationController)
    }
    
    func showSongs(navigationController: UINavigationController)
    {
        router?.pushSongPage(navigationConroller: navigationController)
    }
}
