//
//  BaseTabBarController.swift
//  LittleAppSwift
//
//  Created by 曹奕程 on 2017/9/14.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 给标签控制器添加子控制器
        let littlePlayerCtrl = BaseNavgationController(rootViewController: LittlePlayerViewController())
        let musicCtrl = BaseNavgationController(rootViewController: MusicViewController())
        let mainCtrl = BaseNavgationController(rootViewController: MainViewController())
        let exploreCtrl = BaseNavgationController(rootViewController: ExploreViewController())
        let settingCtrl = BaseNavgationController(rootViewController: SettingViewController())
        
        addChildViewController(littlePlayerCtrl)
        addChildViewController(musicCtrl)
        addChildViewController(mainCtrl)
        addChildViewController(exploreCtrl)
        addChildViewController(settingCtrl)
        
        let normalImages = ["小玩意", "音乐", "主页", "探索", "设置"]
        let selectImages = ["小玩意选中", "音乐选中", "主页选中", "探索选中", "设置选中"]
        
        // 背景颜色
        tabBar.barTintColor = Public_Color
        
        for i in 0..<normalImages.count {
            
            let ctrl = viewControllers?[i]
            
            // 图片
            ctrl?.tabBarItem.image = UIImage(named: normalImages[i])
            ctrl?.tabBarItem.selectedImage = UIImage(named: selectImages[i])
            
            // (重要)如果不设置这个，那么初始的界面，未选中过的标签将不会显示title
            ctrl?.tabBarItem.title = normalImages[i]
            
            // 字体颜色
            ctrl?.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for:UIControlState.disabled)
            ctrl?.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for:UIControlState.selected)

        }
        
        
        
        
    }

    
    
    
    
    
    
    
    
    
    

}
