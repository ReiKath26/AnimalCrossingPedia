//
//  MainCollectionViewcell.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import UIKit

class MainCollectionViewcell: UICollectionViewCell {
    
    static let identifier = "MainCollectionViewCell"
    
    
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
    
    var image: UIImage?
    {
        didSet
        {
            myImageView.image = image
        }
    }
    
    var text: String?
    {
        didSet
        {
            myLabel.text = text
        }
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .init(red: 162/255, green: 222/255, blue: 158/255, alpha: 1)
        contentView.layer.cornerRadius = 10
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myLabel.frame = CGRect(x: 5, y: contentView.frame.size.height - 50, width: contentView.frame.size.width - 10, height: 50)
        myImageView.frame = CGRect(x: 5, y: 0, width: contentView.frame.size.width - 10, height: contentView.frame.size.height - 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
