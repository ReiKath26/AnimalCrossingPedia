//
//  FishInteractor.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation

class FishInteractor: AnyFishInteractor
{
    var presenter: AnyFishPresenter?
    
    func getFish() {
        guard let url = URL(string: bugAPI) else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else
            {
                self?.presenter?.DidFetchAllFishes(with: .failure(FetchError.failed))
                return
            }
            
            do
            {
                let entities = try JSONDecoder().decode([Fish].self, from: data)
                
                self?.presenter?.DidFetchAllFishes(with: .success(entities))
            }
            catch
            {
                self?.presenter?.DidFetchAllFishes(with: .failure(FetchError.failed))
            }
        }
        
        task.resume()
    }
}
