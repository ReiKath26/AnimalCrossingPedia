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
    
    var isPlaying = false
    
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
        lbl.font = .systemFont(ofSize: 20)
        lbl.textColor = UIColor.accentBrown
        return lbl
    }()
    
    private let myButton: UIButton =
    {
        let btn = UIButton()
        btn.tintColor = UIColor.accentBrown
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.softBrown
        contentView.layer.cornerRadius = 10
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .bold, scale: .large)
        myButton.setImage(UIImage(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill", withConfiguration: largeConfig), for: .normal)
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
        contentView.addSubview(myButton)
        myButton.addTarget(self, action: #selector(didPlaySong), for: .touchUpInside)
    }
    
    @objc private func didPlaySong()
    {
        print("Play!")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myLabel.frame = CGRect(x: 5, y: contentView.frame.size.height/2 + 120, width: contentView.frame.size.width - 10, height: 20)
        myImageView.frame = CGRect(x: 20, y: 50, width: contentView.frame.size.width - 50, height: contentView.frame.size.width - 50)
        myButton.frame = CGRect(x: contentView.frame.size.width/2 - 30, y: contentView.frame.size.height/2 + 150, width: contentView.frame.size.width/5, height: contentView.frame.size.width/5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
