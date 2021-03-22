//
//  YYTabBarController.swift
//  ToolsPro
//
//  Created by 杨引 on 2021/3/8.
//

import UIKit

class YYTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        let homeVC = HomeViewController()
        let homeNav = YYNavigationController(rootViewController: homeVC)
        let tabBarItem = UITabBarItem()
        tabBarItem.selectedImage = R.image.home_select()?.withRenderingMode(.alwaysOriginal)
        tabBarItem.image = R.image.home_unSelect()?.withRenderingMode(.alwaysOriginal)
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.lightGray], for: .normal)
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: .selected)
        tabBarItem.title = "首页"
        homeVC.tabBarItem = tabBarItem
        
        let mineVC = MineViewController()
        let mineNav = YYNavigationController(rootViewController: mineVC)
        let mineTabBarItem = UITabBarItem()
        mineTabBarItem.selectedImage = R.image.personCenter_select()?.withRenderingMode(.alwaysOriginal)
        mineTabBarItem.image = R.image.personCenter_unSelect()?.withRenderingMode(.alwaysOriginal)
        mineTabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.lightGray], for: .normal)
        mineTabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: .selected)
        mineTabBarItem.title = "我的"
        mineVC.tabBarItem = mineTabBarItem
        
        self.addChild(homeNav)
        self.addChild(mineNav)
        
    }
    
    
    
    
}
