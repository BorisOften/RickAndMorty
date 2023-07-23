//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 1/22/23.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    let characterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
    }
}

extension RMCharacterViewController: RMCharacterListViewDelegate {
    func didSelectACharacter(_ character: RMCharacter) {
        
        let viewmodel = RMCharacterDetailViewModel()
        let destVC = RMCharacterDetailViewController(viewModel: viewmodel, character: character)
        
        navigationController?.pushViewController(destVC, animated: true)
    }
}

extension RMCharacterViewController {
    
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
        title = "Characters"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: - Add SubViews
    func addSubViews() {
        view.addSubview(characterListView)
    }
    
    //MARK: - Assign Data and Style Views
    func assignStaticData() {
        characterListView.delegate = self
        
    }
    
    //MARK: - Assign Data from Server/Model
    func assignData() {
        
    }
    
    //MARK: - Set Layout Contraints
    func setAutoLayoutContraint()  {
        
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

