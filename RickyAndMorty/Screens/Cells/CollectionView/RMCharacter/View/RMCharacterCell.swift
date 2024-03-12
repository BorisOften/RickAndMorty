//
//  RMCharacterCell.swift
//  RickyAndMorty
//
//  Created by Banye on 1/6/24.
//

import Foundation
import UIKit


class RMCharacterCell: UICollectionViewCell {
    
    static let reuseID = "RMCharacterCel"
    
    var avatarImg = UIImageView(frame: .zero)
    var nameLabel = UILabel()
    var statusLabel = UILabel()
    
    var viewModel: RMCharacterCellViewModel? {
        didSet {
            bindViewModelMethods()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(
        character: RMCharacter,
        viewModel: RMCharacterCellViewModel = RMCharacterCellViewModel(
            service: RMCharacterCellService()
        )
    ) {
        self.viewModel = viewModel
        
        self.nameLabel.text = character.name
        self.statusLabel.text = "Status: \(character.status.rawValue.capitalized)"
        
        Task {
            await self.viewModel?.fetchImage(imageURL: character.image)
        }
        
        //print(Unmanaged.passUnretained(self.viewModel!).toOpaque())
    }
}

//MARK: Binding viewModel
extension RMCharacterCell {
    
    func bindViewModelMethods() {
        viewModel?.avatarImage = { image in
            
            UIView.transition(with: self, duration: 0.4, options: .transitionCrossDissolve, animations: {
                self.avatarImg.image = image
            })
        }
        
        viewModel?.error = { _ in
            
        }
    }
}

extension RMCharacterCell {
    
    func configureCell() { 
        
        
        addAvaterImg()
        addNameLabel()
        addStatusLabel()
    }
    
    private func addAvaterImg() {
        contentView.addSubview(avatarImg)
        
        avatarImg.translatesAutoresizingMaskIntoConstraints = false
        avatarImg.clipsToBounds = true
        avatarImg.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            avatarImg.topAnchor.constraint(equalTo: topAnchor),
            avatarImg.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatarImg.trailingAnchor.constraint(equalTo: trailingAnchor),
            avatarImg.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70)

        ])
    }
    
    private func addNameLabel() {
        contentView.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.clipsToBounds = true
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: avatarImg.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func addStatusLabel() {
        contentView.addSubview(statusLabel)
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.clipsToBounds = true
        statusLabel.textAlignment = .center
        statusLabel.font = .systemFont(ofSize: 18, weight: .regular)
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -5),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        contentView.backgroundColor = .secondarySystemBackground
        
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowOpacity = 0.7
        contentView.layer.shadowRadius = 1
        contentView.layer.shadowColor = UIColor.label.cgColor
    }

}
