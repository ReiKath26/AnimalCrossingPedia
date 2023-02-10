//
//  VillagerViewController.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import UIKit

class VillagerViewController: UIViewController, AnyVillagerView, UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return villager.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = villagerCollectionView?.dequeueReusableCell(withReuseIdentifier: VillagerCollectionViewCell.identifier, for: indexPath) as! VillagerCollectionViewCell
        cell.villager = villager[indexPath.row]
        return cell
    }
    
    
    var presenter: AnyVillagerPresenter?
    
    var villager: [Villager] = []
    
    private var villagerCollectionView: UICollectionView?
    
    private var errorImage: UIImageView =
    {
        let img = UIImageView()
        img.image = UIImage(named: "acnh_icon")
        img.isHidden = true
        return img
    }()
    
    private var errorLabel: UILabel =
    {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.isHidden = true
        return lbl
    }()
    
    
    func update(with data: [Villager]) {
        
        DispatchQueue.main.async {
            print(data.count)
            self.errorLabel.isHidden = true
            self.errorImage.isHidden = true
            self.villagerCollectionView?.isHidden = false
            self.villager = data
            self.villagerCollectionView?.reloadData()
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            print(error)
            self.errorLabel.isHidden = false
            self.errorImage.isHidden = false
            self.villagerCollectionView?.isHidden = true
            self.errorLabel.text = error
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width/2) - 10 , height: (view.frame.size.height/10) - 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        villagerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        villagerCollectionView?.register(VillagerCollectionViewCell.self, forCellWithReuseIdentifier: VillagerCollectionViewCell.identifier)
        
        guard let collectionView = villagerCollectionView else {return}
        view.addSubview(collectionView)
        view.addSubview(errorImage)
        view.addSubview(errorLabel)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = CGRect(x: 5, y: 20, width: view.frame.size.width - 10, height: view.frame.size.height - 10)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
