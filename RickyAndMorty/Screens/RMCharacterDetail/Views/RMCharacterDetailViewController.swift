//
//  RMCharacterDetail.swift
//  RickyAndMorty
//
//  Created by Banye on 1/9/24.
//

import Foundation
import UIKit

class RMCharacterDetailViewController: UIViewController {
    
    var characterImageView = UIImageView(frame: .zero)
    
    
    let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        configureViewController()
    }
}
