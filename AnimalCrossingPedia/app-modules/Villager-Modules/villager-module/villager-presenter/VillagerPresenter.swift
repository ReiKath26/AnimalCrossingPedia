//
//  VillagerPresenter.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation
import UIKit

class VillagerPresenter: AnyVillagerPresenter
{
    
    var router: AnyVillagerRouter?

    var interactor: AnyVillagerInteractor?
    {
        didSet
        {
            interactor?.getVillagers()
        }
    }
    
    var view: AnyVillagerView?
    
    func DidFetchVillagers(with result: Result<[Villager], Error>) {
        switch result {
        case .success(let villager):
            view?.update(with: villager)
        case .failure:
            view?.update(with: "Something went wrong...")
        }
    }
    
    func seeVillagerDetail(navigationController: UINavigationController, villager: Villager)
    {
        router?.pushDetailPage(navigationConroller: navigationController, villager: villager)
    }
    
    
}
