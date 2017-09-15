//
//  LittlePlayerCell.swift
//  LittleAppSwift
//
//  Created by 曹奕程 on 2017/9/15.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

// 小玩意菜单列表的单元格
// 图片+名字

import UIKit

class LittlePlayerCell: UICollectionViewCell {
    
    // MARK:======================================全局变量========================================
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontSizeToFitWidth = true
        
    }

}
