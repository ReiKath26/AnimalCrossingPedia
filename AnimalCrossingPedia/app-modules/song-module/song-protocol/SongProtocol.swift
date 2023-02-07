//
//  SongProtocol.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import Foundation
import UIKit

protocol AnySongView
{
    var presenter: AnySongPresenter? {get set}
    
    func update(with data: [Songs])
    func update(with error: String)
}

protocol AnySongInteractor
{
    var presenter: AnySongPresenter? {get set}
    
    func getSongs()
}

protocol AnySongPresenter
{
    var router: AnySongRouter? {get set}
    var interactor: AnySongInteractor? {get set}
    var view: AnySongView? {get set}
    
    func DidFetchSongs(with result: Result<[Songs], Error>)
}

typealias SongPage = AnySongView & UIViewController

protocol AnySongRouter
{
    var entry: SongPage? { get }
    static func create() -> AnySongRouter
}
