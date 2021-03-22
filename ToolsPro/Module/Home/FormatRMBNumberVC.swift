//
//  FormatRMBNumberVC.swift
//  ToolsPro
//
//  Created by 杨引 on 2021/3/9.
//

import UIKit

class FormatRMBNumberVC: YYViewController {

    var inputTF : UITextField!
    var clearBtn : UIButton!
    
    var outTF : UITextField!
    var copyBtn : UIButton!
    
    var changeBtn : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        _initializeViews()
        _initializeLayoutViews()
        
    }

    override func _initializeViews() {
        super._initializeViews()
        self.navView.title.text = "人民币大写转换"
        
        inputTF = UITextField()
        inputTF.placeholder = "请输入数字金额"
        inputTF.font = .systemFont(ofSize: 14)
        inputTF.clearButtonMode = .whileEditing
        inputTF.layer.cornerRadius = 4
        inputTF.layer.borderWidth = 1
        inputTF.layer.borderColor = HEXCOLOR(c: 0xcccccc).cgColor
        inputTF.textAlignment = .center
        inputTF.keyboardType = .decimalPad
        view.addSubview(inputTF)
        
        clearBtn = UIButton(type: .custom)
        clearBtn.setTitle("清空", for: .normal)
        clearBtn.backgroundColor = .green
        clearBtn.addTarget(self, action: #selector(clearAction), for: .touchUpInside)
        clearBtn.layer.cornerRadius = 4
        view.addSubview(clearBtn)
        
        outTF = UITextField()
        outTF.font = .systemFont(ofSize: 14)
        outTF.clearButtonMode = .whileEditing
        outTF.layer.cornerRadius = 4
        outTF.layer.borderWidth = 1
        outTF.textAlignment = .center
        outTF.layer.borderColor = HEXCOLOR(c: 0xcccccc).cgColor
        view.addSubview(outTF)
        
        copyBtn = UIButton(type: .custom)
        copyBtn.setTitle("复制", for: .normal)
        copyBtn.layer.borderWidth = 0.5
        copyBtn.layer.borderColor = HEXCOLOR(c: 0xcccccc).cgColor
        copyBtn.setTitleColor(.green, for: .normal)
        copyBtn.addTarget(self, action: #selector(copyAction), for: .touchUpInside)
        copyBtn.layer.cornerRadius = 4
        view.addSubview(copyBtn)
        
        
        changeBtn = UIButton(type: .custom)
        changeBtn.setTitle("人民币大写转换", for: .normal)
        changeBtn.backgroundColor = .green
        changeBtn.addTarget(self, action: #selector(changeAction), for: .touchUpInside)
        changeBtn.layer.cornerRadius = 6
        view.addSubview(changeBtn)
        
    }
    
    override func _initializeLayoutViews() {
        
        inputTF.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(view.snp.top).offset(120)
            make.height.equalTo(30)
            make.width.equalToSuperview().multipliedBy(0.6)
        }
        
        clearBtn.snp.makeConstraints { (make) in
            make.left.equalTo(inputTF.snp.right).offset(10)
            make.top.height.equalTo(inputTF)
            make.height.equalTo(30)
            make.right.equalToSuperview().offset(-20)
        }
        
        outTF.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(inputTF)
            make.top.equalTo(inputTF.snp.bottom).offset(20)
        }
        
        copyBtn.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(clearBtn)
            make.top.equalTo(outTF)
        }
        
        changeBtn.snp.makeConstraints { (make) in
            make.left.equalTo(inputTF)
            make.right.equalTo(clearBtn)
            make.top.equalTo(outTF.snp.bottom).offset(20)
            make.height.equalTo(outTF)
        }
        
    }
    
    @objc func clearAction () {
        inputTF.text = ""
    }
    
    @objc func copyAction () {
        UIPasteboard.general.string = inputTF.text
        debugPrint("copyAction",UIPasteboard.general.string ?? "")
    }
    
    @objc func changeAction () {
        
        if inputTF.text != nil && inputTF.text?.count ?? 0 > 0 {
            
            if ((inputTF.text?.validateNumberPoint()) != false) {
                let rmbStr = Double(inputTF.text ?? "0")?.numberRMM()
                outTF.text = rmbStr
                UIPasteboard.general.string = rmbStr
            }else{                
                self.view.makeToast("请输入有效数字")
            }
        } else {
            log.debug("请输入有效数字")
            self.view.makeToast("请输入有效数字")
        }
        
    }
}




extension Double {
    func numberRMM() -> String {
        return String(self).numberRMM()
    }
}
extension String {
    
    //检测字符串是不是 12345678.12 格式
    func validateNumberPoint() -> Bool {
        var res = true
        let set = NSCharacterSet(charactersIn: "0123456789.")
        var i = 0
        // 是否是 0123456789. 里面的字符串
        while i < self.count {
            let subStr = NSString.init(string: String.init(self[safe: i] ?? Character.init("")))
            if (subStr.rangeOfCharacter(from: set as CharacterSet).length == 0) {
                res = false
                break
            }
            i+=1
        }
        // 小数点的额个数是不是小于等于一个
        let arr = self.charactersArray
            .enumerated()
            .filter { $0.element == "." }
            .map { $0.offset }
        log.debug(arr)
        if arr.count > 1 {
            res = false
        }
        return res
    }
    
    /// 人名币大写
    func numberRMM() -> String {
        guard let num = Double(self) else {
            return ""
        }
        let format = NumberFormatter()
        format.locale = Locale(identifier: "zh_CN")
        format.numberStyle = .spellOut
        format.minimumIntegerDigits = 1
        format.minimumFractionDigits = 0
        format.maximumFractionDigits = 2
        let text = format.string(from: NSNumber(value: num)) ?? ""
        let sept = self.components(separatedBy: ".")
        let decimals: Double? = sept.count == 2 ? Double("0." + sept.last!) : nil
        return self.formatRMM(text: text, isInt: decimals == nil || decimals! < 0.01)
    }

    private func formatRMM(text: String, isInt: Bool) -> String {
        let formattedString = text.replacingOccurrences(of: "一", with: "壹")
                                  .replacingOccurrences(of: "二", with: "贰")
                                  .replacingOccurrences(of: "三", with: "叁")
                                  .replacingOccurrences(of: "四", with: "肆")
                                  .replacingOccurrences(of: "五", with: "伍")
                                  .replacingOccurrences(of: "六", with: "陆")
                                  .replacingOccurrences(of: "七", with: "柒")
                                  .replacingOccurrences(of: "八", with: "捌")
                                  .replacingOccurrences(of: "九", with: "玖")
                                  .replacingOccurrences(of: "十", with: "拾")
                                  .replacingOccurrences(of: "百", with: "佰")
                                  .replacingOccurrences(of: "千", with: "仟")
                                  .replacingOccurrences(of: "〇", with: "零")
        let sept = formattedString.components(separatedBy: "点")
        var intStr = sept[0]
        if sept.count > 0 && isInt {
            // 整数处理
            return intStr.appending("元整")
        } else {
            // 小数处理
            let decStr = sept[1]
            intStr = intStr.appending("元").appending("\(decStr.first!)角")
            if decStr.count > 1 {
                intStr = intStr.appending("\(decStr[decStr.index(decStr.startIndex, offsetBy: 1)])分")
            } else {
                intStr = intStr.appending("零分")
            }
            return intStr
        }
    }
}
