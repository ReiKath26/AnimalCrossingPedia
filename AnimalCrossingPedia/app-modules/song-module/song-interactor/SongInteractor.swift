//
//  SongInteractor.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation

class SongInteractor: AnySongInteractor
{
    var presenter: AnySongPresenter?
    
    func getSongs()
    {
        guard let url = URL(string: songsAPI) else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else
            {
                self?.presenter?.DidFetchSongs(with: .failure(FetchError.failed))
                return
            }
            
            do
            {
                let entities = try JSONDecoder().decode([Songs].self, from: data)
                
                self?.presenter?.DidFetchSongs(with: .success(entities))
            }
            catch
            {
                self?.presenter?.DidFetchSongs(with: .failure(FetchError.failed))
            }
        }
        
        task.resume()
    }
}
