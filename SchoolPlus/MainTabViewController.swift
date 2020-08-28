//
//  MainTabViewController.swift
//  SchoolPlus
//
//  Created by 金含霖 on 2020/7/17.
//  Copyright © 2020 金含霖. All rights reserved.
//


import UIKit

class MainTabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func initControllers() {
        let school = Navigator.getViewController(key: "校园")
        let group = Navigator.getViewController(key: "组织")
        let info = Navigator.getViewController(key: "信息")
        let my = Navigator.getViewController(key: "我的")
        let page = PageViewController()
        let auth = AuthenticationViewController()
        
        let schoolItem = UITabBarItem(title: "校园", image: nil, tag: 0)
        let groupItem = UITabBarItem(title: "组织", image: nil, tag: 1)
        let infoItem = UITabBarItem(title: "信息", image: nil, tag: 2)
        let myItem = UITabBarItem(title: "我的", image: nil, tag: 3)
        
        page.tabBarItem = schoolItem
        group.tabBarItem = groupItem
        auth.tabBarItem = infoItem
        my.tabBarItem = myItem
        
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = UIColor.white
        
        let viewControllers = [page,group,auth,my]
        self.setViewControllers(viewControllers, animated: false)
        self.selectedIndex = 1
    }
}