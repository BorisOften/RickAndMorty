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
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    var viewModel: RMCharacterDetailViewModel
    
    var cancellables: Set<AnyCancellable> = []
    
    init(viewModel: RMCharacterDetailViewModel, image: UIImage) {
        self.viewModel = viewModel
        self.characterPhoto.image = image
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
        configureViewController()
    }
}

// MARK: - ViewModel Callers
extension RMCharacterDetailViewController {
    func getCharterDetailInfo() {
        //viewModel.getCharterDetailInfo(characterId: character.id)
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
extension RMCharacterDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == infoCollectionView {
            return viewModel.sections.count
        } else {
            return viewModel.character.episode.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == infoCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterDetailInfoCell.cellIdentifier, for: indexPath) as! RMCharacterDetailInfoCell
            cell.setup(with: viewModel.sections[indexPath.row])
            return cell
        } else {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterDetailEpisodeCell.cellIdentifier, for: indexPath) as! RMCharacterDetailEpisodeCell
            cell.setup(with: viewModel.character.episode[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = view.window?.windowScene?.screen.bounds
        let width = ((bounds?.width ?? 320) - 35)/2
        
        if collectionView == infoCollectionView {
            return CGSize(width: width, height: 100)
        } else {
            return CGSize(width: 170, height: 80)
        }
        
    }
}



