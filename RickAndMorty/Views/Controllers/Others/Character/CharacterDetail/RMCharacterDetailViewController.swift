//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 6/6/23.
//

import UIKit
import Combine

final class RMCharacterDetailViewController: UIViewController {
    
    var scrollView = UIScrollView()
    var contentView = UIView()
    let spinner = UIActivityIndicatorView(style: .large)
    var characterPhoto = UIImageView(frame: .zero)
    public var infoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    var episodesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    var viewModel: RMCharacterDetailViewModel
    var character: RMCharacter
    
    var cancellables: Set<AnyCancellable> = []
    
    init(viewModel: RMCharacterDetailViewModel, character: RMCharacter) {
        self.viewModel = viewModel
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
//    convenience init() {
//        self.init()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .red
        configureViewController()
    }
}

// MARK: - ViewModel Callers
extension RMCharacterDetailViewController {
    func getCharterDetailInfo() {
        viewModel.getCharterDetailInfo(characterId: character.id)
    }
}

// MARK: - ViewModel Binding
extension RMCharacterDetailViewController {
    func bindCharterDetailInfo() {
        viewModel.$character.sink { charater in
            
        }.store(in: &cancellables)
    }
}

// MARK: - UICollectionViewDelegate
extension RMCharacterDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell
        
        if collectionView == infoCollectionView {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterDetailInfoCell.cellIdentifier, for: indexPath)
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterDetailEpisodeCell.cellIdentifier, for: indexPath)
        }
        cell.backgroundColor = .red
        return cell
    }
}



