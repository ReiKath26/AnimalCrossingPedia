//
//  BugProtocol.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation
import UIKit

protocol AnyBugView
{
    var presenter: AnyBugPresenter? {get set}
    
    func update(with data: [Bugs])
    func update(with error: String)
}

protocol AnyBugInteractor
{
    var presenter: AnyBugPresenter? {get set}
    func getBugs()
}

protocol AnyBugPresenter
{
    var router: AnyBugRouter? {get set}
    var interactor: AnyBugInteractor? {get set}
    var view: AnyBugView? {get set}
    
    func DidFetchAllBugs(with result: Result<[Bugs], Error>)
    func seeBugsDetail(navigationController: UINavigationController, bug: Bugs)
}

protocol AnyBugRouter
{
    var bugView: BugViewController? { get }
    static func createMainPage() -> AnyBugRouter
    
    func pushDetailPage(navigationConroller navigationController: UINavigationController, bug: Bugs)
}



