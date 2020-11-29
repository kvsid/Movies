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
        listVC.tabBarItem = UITabBarItem(title: "List", image: nil, tag: 0)
        favouritesVC.tabBarItem = UITabBarItem(title: "Favourites", image: nil, tag: 1)

        styleBarItem(listVC.tabBarItem)
        styleBarItem(favouritesVC.tabBarItem)
    }

    func viewControllers() -> [UIViewController] {
        return [listVC, favouritesVC]
    }

    private func styleBarItem(_ item: UIBarItem) {
        let attributes: [NSMutableAttributedString.Key: Any] = [
            .font: UIFont(name: "Helvetica", size: CGFloat(15.0))!,
            .foregroundColor: UIColor.systemTeal,
            .paragraphStyle: NSMutableParagraphStyle().alignment = .center
        ]

        item.setTitleTextAttributes(attributes, for: .normal)
    }
}
