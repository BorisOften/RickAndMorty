//
//  RMCharacterViewController+SetupUI.swift
//  RickyAndMorty
//
//  Created by Banye on 1/6/24.
//

import Foundation
import UIKit

extension RMCharacterViewController {
    
    func configureViewController() {
        self.title = "Character"
        
        addSubViews()
    }
    
    func addSubViews() {
        addCollectionView()
        addLoadingSpinnerView()
    }
    
    func addLoadingSpinnerView() {
        view.addSubview(loadingSpinner)
        
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        loadingSpinner.style = .large
        loadingSpinner.startAnimating()
        
        NSLayoutConstraint.activate([
            loadingSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func addCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RMCharacterCell.self, forCellWithReuseIdentifier: RMCharacterCell.reuseID)
        collectionView.register(RMFooterLoadingCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: RMFooterLoadingCollectionView.reuseID)
        collectionView.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
        ])
    }
}
