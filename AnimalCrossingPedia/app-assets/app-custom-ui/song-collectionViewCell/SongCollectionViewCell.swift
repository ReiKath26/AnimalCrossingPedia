//
//  SongCollectionViewCell.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 08/02/23.
//

import UIKit

class SongCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SongCollectionViewCell"
    
    var song: Songs?
    {
        didSet
        {
            myLabel.text = song?.name.USName
            
            guard let url = URL(string: song?.imageURL ?? "http://acnhapi.com/v1/images/songs/" + String(song?.id ?? 1)) else {return}
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else
                {
                    self?.myImageView.image = UIImage(named: "acnh_icon")
                    return
                }
                
                DispatchQueue.main.async {
                    self?.myImageView.image = UIImage(data: data)
                }
               
            }
            task.resume()
        }
    }
    
    private let myImageView: UIImageView =
    {
        let img = UIImageView()
        img.image = UIImage(named: "acnh_icon")
        return img
    }()
    
    private let myLabel: UILabel =
    {
        let lbl = UILabel()
        lbl.text = "Menu"
        lbl.textAlignment = .center
        lbl.textColor = .init(red: 10/255, green: 154/255, blue: 0/255, alpha: 1)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .init(red: 162/255, green: 222/255, blue: 158/255, alpha: 1)
        contentView.layer.cornerRadius = 10
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myLabel.frame = CGRect(x: contentView.frame.size.width - (contentView.frame.size.width/3), y: 5, width: contentView.frame.size.width - (contentView.frame.size.width/3), height: contentView.frame.size.width/3)
        myImageView.frame = CGRect(x: 5, y: 5, width: contentView.frame.size.width/3, height: contentView.frame.size.width/3)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
