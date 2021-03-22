//
//  Config.swift
//  ToolsPro
//
//  Created by 杨引 on 2021/3/18.
//

import UIKit
import Foundation


@_exported import SnapKit
@_exported import Kingfisher
@_exported import SwifterSwift
@_exported import PKHUD
@_exported import Hue
@_exported import Toast_Swift
@_exported import Dollar
@_exported import LTMorphingLabel


 
/// 屏幕宽度
let SCREEN_WIDTH = UIScreen.main.bounds.size.width;
/// 屏幕高度
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height;
 
/// 状态栏高度
let kStatusBarHeight = UIApplication.shared.statusBarFrame.height;
/// 导航栏高度
let kNavHeight = UINavigationController.init().navigationBar.frame.height;
/// 导航+状态栏 高度
let kTopNavHeight = kStatusBarHeight + kNavHeight;
 
/// 16进制颜色转UIColor
func HEXCOLOR(c: UInt64) -> (UIColor) {
    let redValue = CGFloat((c & 0xFF0000) >> 16)/255.0
    let greenValue = CGFloat((c & 0xFF00) >> 8)/255.0
    let blueValue = CGFloat(c & 0xFF)/255.0
    return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0);
}
