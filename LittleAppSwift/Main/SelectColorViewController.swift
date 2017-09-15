//
//  SelectColorViewController.swift
//  LittleAppSwift
//
//  Created by 曹奕程 on 2017/9/15.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

// 取色板
// 能够通过调节RGBA获取颜色，实时显示色值，点击确定按钮可传递色值

import UIKit

class SelectColorViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "取色板"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
