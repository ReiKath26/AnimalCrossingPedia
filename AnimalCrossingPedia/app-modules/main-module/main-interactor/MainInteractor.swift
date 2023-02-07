//
//  MainInteractor.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 06/02/23.
//

import Foundation
import UIKit

class MainInteractor: AnyMainInteractor
{
    var presenter: AnyMainPresenter?
    
    func getIcons() {
//
        let titles: [String] = ["Villagers", "Fishes", "Bugs", "Songs"]
//
        for x in 0..<iconsAPI.count
        {
            guard let url = URL(string: iconsAPI[x]) else {return}
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else
                {
                    self?.presenter?.DidFetchAllIcons(with: .failure(FetchError.failed))
                    return
                }
                
                self?.presenter?.DidFetchAllIcons(with: .success(menu(icon: UIImage(data: data), title: titles[x])))
            }
            task.resume()
        }
        
      
    }
    
    
}
