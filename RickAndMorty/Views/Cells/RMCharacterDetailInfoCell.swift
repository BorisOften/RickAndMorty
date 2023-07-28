//
//  RMCharacterDetailInfoCell.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 7/23/23.
//

import Foundation
import UIKit

class RMCharacterDetailInfoCell: UICollectionViewCell {
    
    static let cellIdentifier = "RMCharacterDetailInfoCell"
    
    var nameLabel = UILabel()
    var statusLabel = UILabel()
    var bellImage = UIImageView(image: UIImage(systemName: "bell"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RMCharacterDetailInfoCell {
    func setup(with characterInfo: RMCharacterInfo) {
        nameLabel.text = characterInfo.name
        statusLabel.text = characterInfo.type.rawValue
        bellImage.tintColor = characterInfo.color
    }
    
}

extension RMCharacterDetailInfoCell {
    
    //MARK: - Configure ViewController
    private func configureCell() {
        addSubViews()
        assignStaticData()
        setAutoLayoutContraint()
        
    }
    
    //MARK: - Add SubViews
    func addSubViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(bellImage)
    }
    
    //MARK: - Assign Data and Style Views
    func assignStaticData() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        
        // nameLabel
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 22, weight: .bold)
        nameLabel.textAlignment = .center
        nameLabel.textColor = .black
        
        // statusLabel
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = .systemFont(ofSize: 20, weight: .medium)
        statusLabel.textAlignment = .center
        statusLabel.textColor = .black
        
        //bellImage
        bellImage.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    //MARK: - Set Layout Contraints
    func setAutoLayoutContraint()  {
        
        NSLayoutConstraint.activate([
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 5),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        NSLayoutConstraint.activate([
            bellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            bellImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bellImage.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}


extension RMCharacterDetailInfoCell {
 
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if previousTraitCollection?.userInterfaceStyle == .light {
            contentView.layer.shadowOpacity = 1
            contentView.layer.shadowColor = UIColor.lightGray.cgColor
            contentView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
            contentView.backgroundColor = .gray
        } else {
            contentView.backgroundColor = .white
        }
    }
}
