//
//  HomeViewController.swift
//  ToolsPro
//
//  Created by 杨引 on 2021/3/8.
//

import UIKit
import SnapKit
import Rswift
import SwiftyJSON

struct HomeModelList : Codable {
    var tools: [HomeModel]
}
struct HomeModel : Codable {
    var title: String
}
class HomeCVCell: UICollectionViewCell {
    var title : UILabel!
    var imageView : UIImageView!
    var item : HomeModel?{
        didSet{
            if let p = self.item {
                self.title.text = p.title
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _initializeViews()
        _initializeLayoutViews()
    }
    
    func _initializeViews()   {
        title = UILabel.init()
        title.text = "hello word"
        addSubview(title)
        
        imageView = UIImageView.init()
        imageView.image = R.image.home_select()
        addSubview(imageView)
    }
    
    func _initializeLayoutViews() {
        title.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(imageView.snp.bottom).offset(10)
        }
        imageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class HomeViewController: YYViewController ,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectionView : UICollectionView!
    var datasource : [HomeModel]! = [] {
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = UICollectionViewFlowLayout()
        let w =  (UIScreen.main.bounds.size.width - 40.0) / 4.0
        let h = w
        flowLayout.itemSize = CGSize.init(width: w, height: h)
        
        collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeCVCell.self, forCellWithReuseIdentifier: "HomeCVCell")
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.center.width.height.equalToSuperview()
        }
        getData()
    }
    
    func getData() {
        let path = Bundle.main.path(forResource: "HomeData", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        do {
            let list = try JSONDecoder().decode(HomeModelList.self, from: data! as Data)
            debugPrint(list)
            self.datasource = list.tools
            
        } catch  {
            
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.datasource.count-1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell : HomeCVCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCVCell", for: indexPath) as? HomeCVCell
        if cell == nil {
            cell = HomeCVCell.init()
        }
        cell?.item = self.datasource[indexPath.row]
        cell!.backgroundColor = .white
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("didSelectItemAt \(indexPath.row)")
        switch indexPath.row {
        case 0:
            let vc = FormatRMBNumberVC()
            navigationController?.pushViewController(vc, animated: true)
        default: break
            
        }
        
        
    }
}
