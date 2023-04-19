//
//  RMEpisodeViewController.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 1/22/23.
//

import UIKit

final class RMEpisodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigation()
    }
    
    func setUpNavigation()  {
        title = "Episodes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
