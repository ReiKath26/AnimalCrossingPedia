//
//  SongViewController.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import UIKit

class SongViewController: UIViewController, AnySongView, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = songCollectionView?.dequeueReusableCell(withReuseIdentifier: SongCollectionViewCell.identifier, for: indexPath) as! SongCollectionViewCell
        cell.song = songs[indexPath.row]
        return cell
    }
    
    
    var presenter: AnySongPresenter?
    
    var songs: [Songs] = []
    
    private var songCollectionView: UICollectionView?
    
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
    
    
    func update(with data: [Songs]) {
        
        DispatchQueue.main.async {
            self.errorLabel.isHidden = true
            self.errorImage.isHidden = true
            self.songCollectionView?.isHidden = false
            self.songs = data
            self.songCollectionView?.reloadData()
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.errorLabel.isHidden = false
            self.errorImage.isHidden = false
            self.songCollectionView?.isHidden = true
            self.errorLabel.text = error
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.size.width - 50, height: view.frame.size.height/2 + 50)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        songCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        songCollectionView?.register(SongCollectionViewCell.self, forCellWithReuseIdentifier: SongCollectionViewCell.identifier)
        
        guard let collectionView = songCollectionView else {return}
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
