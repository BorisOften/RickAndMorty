//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 1/22/23.
//

import UIKit

final class RMLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigation()
    }
    
    func setUpNavigation()  {
        title = "Location"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
