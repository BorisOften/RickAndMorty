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
        
        let request = RMRequest(endPoint: .character)
        print(request.url)
        
        NetworkManager.shared.getRequest(requestUrl: request, expectingType: String) { result in
            switch result {
            case .success(<#T##Success#>)
            }
        }

    }
    
    func setUpNavigation()  {
        title = "Characters"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
