//
//  BaseTableViewCell.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/23.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

@IBDesignable
class BaseTableViewCell: UITableViewCell {
    
    @IBInspectable var unSelectedWhenSelected:Bool! = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        if (self.unSelectedWhenSelected != nil) {
            
        }else{
            super.setSelected(selected, animated: animated)
        }
        // Configure the view for the selected state
    }

}
