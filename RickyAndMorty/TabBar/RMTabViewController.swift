//
//  ViewController.swift
//  RickyAndMorty
//
//  Created by Banye on 12/19/23.
//

import UIKit

class RMTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTabBars()
        
    }
    
    
    private func setUpTabBars() {
        let vc1 = RMCharacterViewController()
        let nav1 = UINavigationController(rootViewController: vc1)
        nav1.tabBarItem = UITabBarItem(title: "Character", image: UIImage(systemName: "person"), tag: 0)
        
        let vc2 = RMLocationViewController()
        let nav2 = UINavigationController(rootViewController: vc2)
        nav2.tabBarItem = UITabBarItem(title: "Location", image: UIImage(systemName: "globe"), tag: 1)
        
        let vc3 = RMEpisodesViewController()
        let nav3 = UINavigationController(rootViewController: vc3)
        nav3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 2)
        
        let vc4 = RMSettingViewController()
        let nav4 = UINavigationController(rootViewController: vc4)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 3)

        //self.viewControllers = [nav1, nav2, nav3, nav4] or do this
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
        
    }
    
    


}

