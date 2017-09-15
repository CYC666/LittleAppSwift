//
//  LittlePlayerViewController.swift
//  LittleAppSwift
//
//  Created by 曹奕程 on 2017/9/14.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

// 小玩意 控制器
// 显示一个菜单列表，点击进入对应菜单下的功能

import UIKit



class LittlePlayerViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK:======================================属性===========================================
    
    var mainCollectionView : UICollectionView? = nil
    let titleArray = ["取色板", "城市列表"]
    
    
    
    // MARK:======================================生命周期========================================
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "小玩意"
        
        // 创建子视图
        creatSubView()
    }

    // MARK:======================================私有方法========================================
    
    // MARK:创建子视图
    func creatSubView() {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.itemSize = CGSize(width: kScreenWidth * 0.25, height: kScreenWidth * 0.25 + 15)
        mainCollectionView = UICollectionView(frame:CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight) , collectionViewLayout: flowLayout)
        mainCollectionView?.backgroundColor = UIColor.white
        mainCollectionView?.alwaysBounceVertical = true
        mainCollectionView?.register(UINib(nibName: "LittlePlayerCell", bundle:Bundle.main), forCellWithReuseIdentifier: "LittlePlayerCell")
        mainCollectionView?.delegate = self
        mainCollectionView?.dataSource = self
        
        view.addSubview(mainCollectionView!)
        
    }
    
    
    // MARK:======================================代理方法========================================
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell : LittlePlayerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LittlePlayerCell", for: indexPath) as! LittlePlayerCell
        
        // 图片
        cell.iconImageView.image = UIImage(named: titleArray[indexPath.row])
        
        // 标题
        cell.nameLabel.text = titleArray[indexPath.row]
        
        return cell
    
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell : LittlePlayerCell = collectionView.cellForItem(at: indexPath) as! LittlePlayerCell
        
        UIView.animate(withDuration: 0.15, animations: { 
            cell.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        }) { (true) in
            UIView.animate(withDuration: 0.2, animations: { 
                cell.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            })
        }
        
        if cell.nameLabel.text == "取色板" {
            let ctrl = SelectColorViewController()
            navigationController?.pushViewController(ctrl, animated: true)
            
        } else if cell.nameLabel.text == "城市列表" {
            let ctrl = CityListViewController()
            navigationController?.pushViewController(ctrl, animated: true)
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
