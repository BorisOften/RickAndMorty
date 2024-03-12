//
//  RMCharacterDetail+SetupUI.swift
//  RickyAndMorty
//
//  Created by Banye on 1/9/24.
//

import Foundation
import UIKit


extension RMCharacterDetailViewController {
    
    func configureViewController() {
        self.title = character.name
        
        addSubViews()
    }
    
    func addSubViews() {
        addScrollView()
        addContentView()
        addCharacterImageView()
        addNameView()
        addTypeView()
        addSpecieView()
        
        setBottomConstraints()
    }
    
    func addScrollView() {
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
    }
    
    func addContentView() {
        scrollView.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo:  scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo:  scrollView.leadingAnchor),
            //contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo:  scrollView.bottomAnchor),
        ])
    }
    
    func addCharacterImageView() {
        contentView.addSubview(self.characterImageView)
        
        self.characterImageView.translatesAutoresizingMaskIntoConstraints = false
        self.characterImageView.contentMode = .scaleToFill
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            characterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            characterImageView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    func addNameView() {
        contentView.addSubview(self.nameView)
        
        self.nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.assignTitleAndValues(title: "Name", value: character.name)
        
        NSLayoutConstraint.activate([
            nameView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 20),
            nameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameView.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -10),
            nameView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func addTypeView() {
        contentView.addSubview(self.typeView)
        
        self.typeView.translatesAutoresizingMaskIntoConstraints = false
        typeView.assignTitleAndValues(title: "Type", value: character.type)
        
        NSLayoutConstraint.activate([
            typeView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 20),
            typeView.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 10),
            typeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            typeView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func addSpecieView() {
        contentView.addSubview(self.specieView)
        
        self.specieView.translatesAutoresizingMaskIntoConstraints = false
        specieView.assignTitleAndValues(title: "Species", value: character.species)
        
        NSLayoutConstraint.activate([
            specieView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 10),
            specieView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            specieView.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -10),
            specieView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func setBottomConstraints() {
        
        NSLayoutConstraint.activate([
            contentView.bottomAnchor.constraint(equalTo: specieView.bottomAnchor, constant: 50)
        ])
    }
}
