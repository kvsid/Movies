//
//  AppTabBarController.swift
//  Movies
//
//  Created by Xenia Sidorova on 26.11.2020.
//

import UIKit

class AppTabBarController: UITabBarController {
    let listVC = ListViewController()
    let favouritesVC = FavouritesViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        listVC.tabBarItem = UITabBarItem.init(title: "List", image: nil, tag: 0)
        favouritesVC.tabBarItem = UITabBarItem.init(title: "Favourites", image: nil, tag: 1)
    }
    
    func viewControllers() -> [UIViewController] {
        return [listVC, favouritesVC]
    }
}
