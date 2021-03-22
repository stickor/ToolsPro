//
//  YYViewController.swift
//  ToolsPro
//
//  Created by 杨引 on 2021/3/8.
//

import UIKit


extension UIViewController {
    class func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return currentViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return currentViewController(base: presented)
        }
        return base
    }
}

extension YYViewController {
    
    
}

class YYViewController: UIViewController {
    
    
    var navView : NavigtionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white;
        navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    open func _initializeViews()   {
        navView = NavigtionView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: kTopNavHeight))
        view.addSubview(navView)
    }
    
    open func _initializeLayoutViews() {
        
    }

}

