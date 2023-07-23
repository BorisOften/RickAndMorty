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
    
    var imageView = UIImageView()
    var nameLabel = UILabel()
    var statusLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RMCharacterDetailInfoCell {
    func setup(with viewModel: RMCharacterCellViewModel) {
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatus.rawValue
        print("Viewmodel",viewModel)
        viewModel.fetchImage { result in
                
                switch result {
                case .success(let data):
                    let image = UIImage(data: data)
                    self.imageView.image = image
                case .failure(let error):
                    print(error)
            }
        }
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
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(statusLabel)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        imageView.layer.cornerRadius = 10
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
    }
    
    //MARK: - Assign Data and Style Views
    func assignStaticData() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        
        // ImageView
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        // nameLabel
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.textAlignment = .center
        nameLabel.textColor = .black
        
        // statusLabel
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = .systemFont(ofSize: 16, weight: .medium)
        statusLabel.textAlignment = .center
        statusLabel.textColor = .gray
    }
    
    //MARK: - Set Layout Contraints
    func setAutoLayoutContraint()  {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: -5),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 10),
            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: -5),
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
