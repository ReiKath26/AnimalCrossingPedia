//
//  MainView.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 04/02/23.
//

import UIKit

class MainViewController: UIViewController, AnyMainView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        switch indexPath.row
        {
            
        case 0:
            presenter?.showVillagers(navigationController: navigationController!)
            print("Click!")
        case 1:
            presenter?.showFishes(navigationController: navigationController!)
            print("Click!")
        case 2:
            presenter?.showBugs(navigationController: navigationController!)
            print("Click!")
        case 3:
            presenter?.showSongs(navigationController: navigationController!)
            print("Click!")
        default:
            presenter?.showVillagers(navigationController: navigationController!)
            print("Click!")
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewcell.identifier, for: indexPath) as! MainCollectionViewcell
        cell.image = menus[indexPath.row].icon
        cell.text = menus[indexPath.row].title
        return cell
    }
    
    var presenter: AnyMainPresenter?
    
    private var collectionView: UICollectionView?
    
    private var titleLbl: UILabel =
    {
        let lbl = UILabel()
        lbl.text = "Welcome to Animal Crossing Pedia!"
        lbl.font = .systemFont(ofSize: 50)
        lbl.textColor = UIColor.accentGreen
        return lbl
    }()
    
    private var contentLbl: UILabel =
    {
        let lbl = UILabel()
        lbl.text = "Find any Animal Crosing info you need here!"
        lbl.font = .systemFont(ofSize: 20)
        lbl.textColor = UIColor.lightGray
        return lbl
    }()
    
    var menus: [menu] = []
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width/2) - 10 , height: (view.frame.size.height/3) - 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(MainCollectionViewcell.self, forCellWithReuseIdentifier: MainCollectionViewcell.identifier)
        
        guard let collectionView = collectionView else {return}
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = CGRect(x: 5, y: 20, width: view.frame.size.width - 10, height: view.frame.size.height - 10)
    }
    
    func update(with data: [menu])
    {
        DispatchQueue.main.async
        {
            self.menus = data
            self.collectionView?.reloadData()
        }
        
    }
    func update(with error: String)
    {
        DispatchQueue.main.async
        {
            self.menus = [menu(icon: UIImage(named: "acnh_icon"), title: "Villagers"),
                          menu(icon: UIImage(named: "acnh_icon"), title: "Fishes"),
                          menu(icon: UIImage(named: "acnh_icon"), title: "Bugs")]
            self.collectionView?.reloadData()
        }
    }

}
