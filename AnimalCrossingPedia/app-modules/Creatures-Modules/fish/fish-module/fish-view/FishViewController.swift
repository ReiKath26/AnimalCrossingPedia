//
//  FishViewController.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import UIKit

class FishViewController: UIViewController, AnyFishView, UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fishes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = fishCollectionView?.dequeueReusableCell(withReuseIdentifier: FishCollectionViewCell.identifier, for: indexPath) as! FishCollectionViewCell
        cell.fish = fishes[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.seeFishDetail(navigationController: navigationController!, fish: fishes[indexPath.row])
    }
    
    var presenter: AnyFishPresenter?
    
    var fishes: [Fish] = []
    
    private var fishCollectionView: UICollectionView?
    
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
    
    
    func update(with data: [Fish]) {
        
        DispatchQueue.main.async {
            print(data.count)
            self.errorLabel.isHidden = true
            self.errorImage.isHidden = true
            self.fishCollectionView?.isHidden = false
            self.fishes = data
            self.fishCollectionView?.reloadData()
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            print(error)
            self.errorLabel.isHidden = false
            self.errorImage.isHidden = false
            self.fishCollectionView?.isHidden = true
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
        fishCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        fishCollectionView?.register(FishCollectionViewCell.self, forCellWithReuseIdentifier: FishCollectionViewCell.identifier)
        
        guard let collectionView = fishCollectionView else {return}
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
