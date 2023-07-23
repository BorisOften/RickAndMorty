//
//  RMCharacterDetailViewController+Setup.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 7/8/23.
//

import Foundation
import UIKit

extension RMCharacterDetailViewController {
    //MARK: - Configure ViewController
    func configureViewController() {
        setupNavigationController()
        addSubViews()
        assignStaticData()
        assignData()
        setAutoLayoutContraint()
        
    }
    
    //MARK: - Setup Navigation Controller
    func setupNavigationController() {
        
    }
    
    //MARK: - Add SubViews
    func addSubViews() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints  = false
        
        contentView.addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(characterPhoto)
        characterPhoto.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(infoCollectionView)
        infoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(episodesCollectionView)
        episodesCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Assign Data and Style Views
    func assignStaticData() {
        infoCollectionView.delegate = self
        infoCollectionView.dataSource = self
        infoCollectionView.register(RMCharacterDetailInfoCell.self, forCellWithReuseIdentifier: RMCharacterDetailInfoCell.cellIdentifier)
        
        episodesCollectionView.delegate = self
        episodesCollectionView.dataSource = self
        episodesCollectionView.register(RMCharacterDetailEpisodeCell.self, forCellWithReuseIdentifier: RMCharacterDetailEpisodeCell.cellIdentifier)
    }
    
    //MARK: - Assign Data from Server/ ParentVC
    func assignData() {
        
    }
    
    //MARK: - Set Layout Contraints
    func setAutoLayoutContraint()  {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            characterPhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            characterPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            characterPhoto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            characterPhoto.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            infoCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            infoCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            infoCollectionView.topAnchor.constraint(equalTo: characterPhoto.bottomAnchor, constant: 10),
            infoCollectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            episodesCollectionView.topAnchor.constraint(equalTo: infoCollectionView.bottomAnchor, constant: -5),
            episodesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            episodesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            episodesCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            contentView.bottomAnchor.constraint(equalTo: episodesCollectionView.bottomAnchor, constant: 10)
        ])
    }
}
