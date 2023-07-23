//
//  CharacterListView+Setup.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 5/31/23.
//

import UIKit

extension RMCharacterListView {
    
    
    
    //MARK: - Configure View
    func configureView() {
        addSubViews()
        assignStaticData()
        assignData()
        setAutoLayoutContraint()
        
    }
    
    //MARK: - Add SubViews
    func addSubViews() {
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    //MARK: - Assign Data and Style Views
    func assignStaticData() {
        translatesAutoresizingMaskIntoConstraints = false

        spinner.hidesWhenStopped = true
        
        collectionView.register(RMCharacterCell.self, forCellWithReuseIdentifier: RMCharacterCell.cellIdentifier)
        collectionView.register(RMFooterLoadingView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: RMFooterLoadingView.identifier)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        
    }
    
    //MARK: - Assign Data from Server/Model
    func assignData() {
        
    }
    
    //MARK: - Set Layout Contraints
    func setAutoLayoutContraint()  {
        
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
