//
//  SongPresenter.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation

class SongPresenter: AnySongPresenter
{
    var router: AnySongRouter?
    
    var view: AnySongView?
    
    var interactor: AnySongInteractor?
    {
        didSet
        {
            interactor?.getSongs()
        }
    }
    
    func DidFetchSongs(with result: Result<[Songs], Error>) {
        switch result
        {
            case .success(let songs):
            view?.update(with: songs)
            case .failure:
            view?.update(with: "Something went wrong...")
        }
    }

}
