//
//  RMCharacterDetail.swift
//  RickyAndMorty
//
//  Created by Banye on 1/9/24.
//

import Foundation
import UIKit

class RMCharacterDetailViewController: UIViewController {
    
    var scrollView = UIScrollView()
    var contentView = UIView()
    var characterImageView = UIImageView(frame: .zero)
    let nameView = RMCharacterSingleInfoView()
    let typeView = RMCharacterSingleInfoView()
    let specieView = RMCharacterSingleInfoView()
    
    let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
        
        super.init(nibName: nil, bundle: nil)
        
        Task {
            await fetchCharacterImage()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
    }
}

// MARK: Other Functions
extension RMCharacterDetailViewController {
    
    // MARK: MAke a viewModel and service and move this there.
    
    // Note:  async await caches by default and since we already had the image,
    // this would propable not perform a nextwork call
    func fetchCharacterImage() async {
        do {
            if let url = URL(string: character.image) {
                let urlRequest = URLRequest(url: url)
                let data = try await RMAPIServiceManager().request(urlRequest)
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.characterImageView.image = image
                    }
                }
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}
