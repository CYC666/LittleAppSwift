//
//  BaseNavgationController.swift
//  LittleAppSwift
//
//  Created by 曹奕程 on 2017/9/14.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

import UIKit

class BaseNavgationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 背景颜色是黑的
        navigationBar.barTintColor = .black
        
        // 主题色是白的
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        
        // 导航栏不透明
        navigationBar.isTranslucent = true
        
        
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
