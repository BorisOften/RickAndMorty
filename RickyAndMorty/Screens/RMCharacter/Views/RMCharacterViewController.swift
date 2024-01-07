//
//  RMCharacterViewController.swift
//  RickyAndMorty
//
//  Created by Banye on 12/22/23.
//

import Foundation
import UIKit

final class RMCharacterViewController: UIViewController {
    
    var collectionView: UICollectionView = {
        var collectViewLayout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectViewLayout)
        return collectionView
    }()
    var loadingSpinner = UIActivityIndicatorView()
    
    
    var viewModel: RMCharacterViewModel
    
    var characterArray: [RMCharacter] = []
    
    init(viewModel: RMCharacterViewModel = RMCharacterViewModel(service: RMCharacterService())) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindAllViewModelFunctions()
        configureViewController()
        
        Task {
            await getAllCharacters()
        }
    }
}


// MARK: Binding ViewModel
extension RMCharacterViewController {
    
    func bindAllViewModelFunctions() {
        bindAllCharacters()
        bindErrors()
    }
    
    func bindAllCharacters() {
        viewModel.allCharacters = { character in
            self.characterArray = character
            self.collectionView.reloadData()
            self.loadingSpinner.stopAnimating()
        }
    }
    
    func bindErrors() {
        viewModel.error = { error in
            print(error)
        }
    }
}


// MARK: ViewModel Callers
extension RMCharacterViewController {
    
    func getAllCharacters() async {
        await viewModel.getAllCharacters(request: .allCharacter)
    }
}

// MARK: UICollectionViewDataSource
extension RMCharacterViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characterArray.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCell.reuseID, for: indexPath) as! RMCharacterCell
        
        let character = self.characterArray[indexPath.row]
        cell.setupCell( character: character, viewModel: RMCharacterCellViewModel(service: RMCharacterCellService()))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       let width = ((collectionView.frame.width - 15) / 2) // 15 because of paddings
       print("cell width : \(width)")
       return CGSize(width: width, height: 320)
   }
}



