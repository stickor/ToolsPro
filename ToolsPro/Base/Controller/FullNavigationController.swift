//
//  FullNavigationController.swift
//  ToolsPro
//
//  Created by 杨引 on 2021/3/18.
//

import UIKit

fileprivate var slideEnabledKey = "slideEnabled"

extension UINavigationController {
    /// should slide to back. default is true
    var slideEnabled: Bool {
        set {
            objc_setAssociatedObject(self, &slideEnabledKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            if let rs = objc_getAssociatedObject(self, &slideEnabledKey) as? Bool {
                return rs
            }
            return true
        }
    }
}

/// the navigationController enabled full screen slide to back
class FullNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        fullSlide()
    }

    func fullSlide() {
        guard let recognizer = interactivePopGestureRecognizer else {
            return
        }
        guard let recognizerView = recognizer.view else {
            return
        }

        // use runtime to check the property name
//        var count: UInt32 = 0
//        let ivars = class_copyIvarList(UIGestureRecognizer.self, &count)!
//        for i in 0..<count {
//            let ivar = ivars[Int(i)]
//            let name = ivar_getName(ivar)
//            print(String(cString: name!))
//        }

        let targets = recognizer.value(forKey: "_targets") as? [NSObject]
        guard let targetObjc = targets?.first else {
            return
        }

        guard let target = targetObjc.value(forKey: "target") else {
            return
        }
        let action = Selector(("handleNavigationTransition:"))
        let fullRecognizer = UIPanGestureRecognizer()
        fullRecognizer.delegate = self
        recognizerView.addGestureRecognizer(fullRecognizer)
        fullRecognizer.addTarget(target, action: action)
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true

        }
        super.pushViewController(viewController, animated: animated)
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return slideEnabled && children.count > 1
    }
}
