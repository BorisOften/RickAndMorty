//
//  RMCharacterDetailEpisodeCell.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 7/23/23.
//

import Foundation
import UIKit


class RMCharacterDetailEpisodeCell: UICollectionViewCell {
    
    static let cellIdentifier = "RMCharacterDetailEpisodeCell"
    
    var episodeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RMCharacterDetailEpisodeCell {
    func setup(with episode: String) {
        episodeLabel.text = episode
    }
    
}

extension RMCharacterDetailEpisodeCell {
    
    //MARK: - Configure ViewController
    private func configureCell() {
        addSubViews()
        assignStaticData()
        setAutoLayoutContraint()
        
    }
    
    //MARK: - Add SubViews
    func addSubViews() {
        contentView.addSubview(episodeLabel)
    }
    
    //MARK: - Assign Data and Style Views
    func assignStaticData() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        
        // episodeLabel
        episodeLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeLabel.numberOfLines = 0
    }
    
    //MARK: - Set Layout Contraints
    func setAutoLayoutContraint()  {
        NSLayoutConstraint.activate([
            episodeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -5),
            episodeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            episodeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            episodeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}

extension RMCharacterDetailEpisodeCell {
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
