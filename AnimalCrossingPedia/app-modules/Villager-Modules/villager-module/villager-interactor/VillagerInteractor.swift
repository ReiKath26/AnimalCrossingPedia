//
//  VillagerInteractor.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation

class VillagerInteractor: AnyVillagerInteractor
{
    var presenter: AnyVillagerPresenter?
    
    func getVillagers() {
        guard let url = URL(string: villagerAPI) else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else
            {
                self?.presenter?.DidFetchVillagers(with: .failure(FetchError.failed))
                return
            }
            
            do
            {
              
                let entities = try JSONDecoder().decode([Villager].self, from: data)
                
                self?.presenter?.DidFetchVillagers(with: .success(entities))
            }
            catch
            {
                self?.presenter?.DidFetchVillagers(with: .failure(FetchError.failed))
            }
        }
        
        task.resume()
    }
    
    
}
