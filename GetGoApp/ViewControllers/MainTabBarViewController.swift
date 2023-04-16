//
//  MainTabBarViewController.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 11/04/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabbarItem()
    }
    
    private func setupTabbarItem() {
        let characterScreen = UINavigationController(rootViewController: CharacterListViewController())
        let tabOneBarItem = UITabBarItem(title: "Character", image: UIImage(named: "octocat_gray"), selectedImage: UIImage(named: "octocat"))
        
        let locationScreen = UINavigationController(rootViewController: LocationListViewController())
        let tabTwoBarItem = UITabBarItem(title: "Location", image: UIImage(named: "place_marker_gray"), selectedImage: UIImage(named: "place_marker"))
        
        let episodeScreen = UINavigationController(rootViewController: EpisodeListViewController())
        let tabThreeBarItem = UITabBarItem(title: "Episode", image: UIImage(named: "episode_gray"), selectedImage: UIImage(named: "episode"))
        
        characterScreen.tabBarItem = tabOneBarItem
        locationScreen.tabBarItem = tabTwoBarItem
        episodeScreen.tabBarItem = tabThreeBarItem
        
        self.viewControllers = [characterScreen, locationScreen, episodeScreen]
    }

}
