//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 1/22/23.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigation()

    }
    
    func setUpNavigation()  {
        title = "Characters"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
