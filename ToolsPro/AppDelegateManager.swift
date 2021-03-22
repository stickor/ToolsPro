//
//  AppDelegateManager.swift
//  ToolsPro
//
//  Created by 杨引 on 2021/3/19.
//

import UIKit
import XCGLogger

let log = XCGLogger.default


class AppDelegateManager: NSObject {
    
    
    open func initConifg() {
        initXCGLogger()
        ToastManager.shared.position = .center
        
        
    }
    open func initXCGLogger() {
        //日志文件地址
        let cachePath = FileManager.default.urls(for: .cachesDirectory,
                                                 in: .userDomainMask)[0]
        let logURL = cachePath.appendingPathComponent("log.txt")
        //日志对象设置
        log.setup(level: .debug, showThreadName: true, showLevel: true,
                  showFileNames: true, showLineNumbers: true,
                  writeToFile: logURL, fileLevel: .debug)
    }
    
    
}
