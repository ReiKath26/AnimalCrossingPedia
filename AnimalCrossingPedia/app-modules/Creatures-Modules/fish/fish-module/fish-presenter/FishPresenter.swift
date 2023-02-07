//
//  FishPresenter.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation

class FishPresenter: AnyFishPresenter
{
    var router: AnyFishRouter?
    
    var interactor: AnyFishInteractor?
    {
        didSet
        {
            interactor?.getFish()
        }
    }
    
    var view: AnyFishView?
    
    func DidFetchAllFishes(with result: Result<[Fish], Error>) {
        switch result {
        case .success(let fishes):
            view?.update(with: fishes)
        case .failure:
            view?.update(with: "Something went wrong...")
        }
    }
    
    
}
