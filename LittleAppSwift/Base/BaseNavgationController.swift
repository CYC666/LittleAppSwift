//
//  BaseNavgationController.swift
//  LittleAppSwift
//
//  Created by 曹奕程 on 2017/9/14.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

// ==========基础导航栏控制器==========
// 所有的导航栏控制器都继承与此控制器


import UIKit

class BaseNavgationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 背景颜色是黑的
        navigationBar.barTintColor = .black
        
        // 设置主题色（右边按钮和左边按钮）
        navigationBar.tintColor = UIColor.white
        
        // 设置主题色（标题的颜色）
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        
        // 导航栏不透明
        navigationBar.isTranslucent = true
        
        
        
    }

    
    // MARK:======================================这个模块主要是控制push隐藏标签栏，pop显示标签栏的========================================
    //每一次push都会执行这个方法，push之前设置viewController的hidesBottomBarWhenPushed
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: true)
        viewController.hidesBottomBarWhenPushed = false
        
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        
        //以下函数是对返回上一级界面之前的设置操作
        //每一次对viewController进行push的时候，会把viewController放入一个栈中
        //每一次对viewController进行pop的时候，会把viewController从栈中移除
        if self.childViewControllers.count == 2 {
            //如果viewController栈中存在的ViewController的个数为两个，再返回上一级界面就是根界面了
            //那么要对tabbar进行显示
            let controller:UIViewController = self.childViewControllers[0]
            controller.hidesBottomBarWhenPushed = false
            
        } else {
            //如果viewController栈中存在的ViewController的个数超过两个，对要返回到的上一级的界面设置hidesBottomBarWhenPushed = true
            //把tabbar进行隐藏
            let count = self.childViewControllers.count-2
            let controller = self.childViewControllers[count]
            controller.hidesBottomBarWhenPushed = true
        }
        
        
        return super.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
