//
//  NavigtionView.swift
//  ToolsPro
//
//  Created by 杨引 on 2021/3/18.
//

import UIKit
import SnapKit

class NavigtionView: YYView {

    lazy var rightBtn : UIButton = {
        let rightBtn = UIButton()
        rightBtn.setTitle("右边", for: .normal)
        self.addSubview(rightBtn)
        rightBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview().offset(kStatusBarHeight*0.5)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        return rightBtn
        
    }()
    var backBtn : UIButton!
    var title : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backBtn = UIButton(type: .custom)
        backBtn.setImage(R.image.back(), for: .normal)
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview().offset(kStatusBarHeight*0.5)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16)
        title.textColor = HEXCOLOR(c: 0x333333)
        self.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(kStatusBarHeight*0.5)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func backAction() {
        UIViewController.currentViewController()?.navigationController?.popViewController(animated: true)
    }
    
}


