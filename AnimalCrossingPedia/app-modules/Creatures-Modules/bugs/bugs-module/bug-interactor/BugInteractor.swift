//
//  BugInteractor.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation

class BugInteractor: AnyBugInteractor
{
    var presenter: AnyBugPresenter?
    
    func getBugs() {
        guard let url = URL(string: bugAPI) else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else
            {
                self?.presenter?.DidFetchAllBugs(with: .failure(FetchError.failed))
                return
            }
            
            do
            {
                let entities = try JSONDecoder().decode([Bugs].self, from: data)
                
                self?.presenter?.DidFetchAllBugs(with: .success(entities))
            }
            catch
            {
                self?.presenter?.DidFetchAllBugs(with: .failure(FetchError.failed))
            }
        }
        
        task.resume()
    }
    
    
}
