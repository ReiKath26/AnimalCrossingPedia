//
//  BugPresenter.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation
import UIKit

class BugPresenter: AnyBugPresenter
{
    func seeBugsDetail(navigationController: UINavigationController, bug: Bugs) {
        router?.pushDetailPage(navigationConroller: navigationController, bug: bug)
    }
    
    var router: AnyBugRouter?
    
    var interactor: AnyBugInteractor?
    {
        didSet
        {
            interactor?.getBugs()
        }
    }
    
    var view: AnyBugView?
    
    func DidFetchAllBugs(with result: Result<[Bugs], Error>) {
        switch result {
        case .success(let bugs):
            view?.update(with: bugs)
        case .failure:
            view?.update(with: "Something went wrong...")
        }
    }
    
    
}
