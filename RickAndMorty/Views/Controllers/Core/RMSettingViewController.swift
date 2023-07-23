//
//  RMSettingViewController.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 1/22/23.
//

import UIKit

class RMSettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigation()
        
    }
    
    func setUpNavigation()  {
        title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
