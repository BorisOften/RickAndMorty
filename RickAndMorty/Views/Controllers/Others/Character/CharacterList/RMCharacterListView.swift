//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 5/31/23.
//

import UIKit
import Combine

protocol RMCharacterListViewDelegate: AnyObject {
    func didSelectACharacter(_ character: RMCharacter)
}

final class RMCharacterListView: UIView {
    
    let viewModel = CharacterListViewViewModel()
    let spinner = UIActivityIndicatorView(style: .large)
    
    var shouldLoadMoreCharacters = true
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    var characters = [RMCharacter]()
    
    weak var delegate: RMCharacterListViewDelegate?
    
    var cancellables: Set<AnyCancellable> = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        
        spinner.startAnimating()
        bindCharacters()
        getCharacters()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Other Functions
extension RMCharacterListView {
    
}

// MARK: - Viewmodel Caller functions
extension RMCharacterListView {
    func getCharacters()  {
        viewModel.getAllCharacters()
    }
    
    func fetchAdditionalCharacters() {
        viewModel.fetchAdditionalCharaters()
    }
}

// MARK: - Binding
extension RMCharacterListView {
    func bindCharacters() {
        viewModel.$allCharacters.sink { [weak self] allcharacters in
            if let characters = allcharacters?.results {
                self?.shouldLoadMoreCharacters = true
                self?.spinner.stopAnimating()
                self?.collectionView.isHidden = false
                UIView.animate(withDuration: 3) {
                    self?.collectionView.alpha = 1
                }
                self?.characters = characters
                self?.collectionView.reloadData()
            }
        }.store(in: &cancellables)
    }
}

// MARK: - Other UICollectionViewDataSource
extension RMCharacterListView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCell.cellIdentifier , for: indexPath) as! RMCharacterCell
        let currentCharater = characters[indexPath.row]
        
        let cellViewModel = RMCharacterCellViewModel(characterName: currentCharater.name, characterStatus: currentCharater.status, CharacterImageUrl: URL(string: currentCharater.image))
        cell.setup(with: cellViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)/2
        let size = CGSize(width: width, height: width * 1.5)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let character = characters[indexPath.row]
        delegate?.didSelectACharacter(character)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionFooter else {
            return UICollectionReusableView()
        }
        
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RMFooterLoadingView.identifier, for: indexPath)
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 100)
    }
}


// MARK:  ScrollView Delegates
extension RMCharacterListView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard viewModel.shouldShowLoadMoreIndicator, shouldLoadMoreCharacters else {
            return
        }
        
        let offset = scrollView.contentOffset.y
        let totalContentHeight = scrollView.contentSize.height
        let totalScrollViewFixedHeight = scrollView.frame.size.height
        
        if offset >= (totalContentHeight - totalScrollViewFixedHeight - 120) {
            //print("Should be loading")
            shouldLoadMoreCharacters = false
            fetchAdditionalCharacters()
        }
    }
}
