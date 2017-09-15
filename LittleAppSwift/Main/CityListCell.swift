//
//  CityListCell.swift
//  LittleAppSwift
//
//  Created by 曹奕程 on 2017/9/15.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

// ==========城市列表单元格==========
// 还能这么描述


import UIKit

class CityListCell: UITableViewCell {
    
    // MARK:======================================属性========================================
    
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
