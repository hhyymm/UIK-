//
//  HorizontalAlignButton.swift
//  WanChouJinRong
//
//  Created by 阳模何 on 16/2/5.
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

import UIKit

class HorizontalAlignButton: BaseBtn {
    var gap:CGFloat! = 0 // 图片和文字之间的间距，default 2
    var hasSetted:Bool = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        _settingView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _settingView()
        updateContentOffset()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _settingView()
        updateContentOffset()
    }
    
    func _settingView(){
        if hasSetted {
            return
        }
        hasSetted = true
        gap = 2
        
        // 确保图片和标题靠左、水平中间对齐，以方便后面调节位置
        self.contentVerticalAlignment = .Center
        self.contentHorizontalAlignment = .Left
        
        self .addObserver(self, forKeyPath: "frame", options: NSKeyValueObservingOptions([.New, .Old]) , context: nil)
        self .addObserver(self, forKeyPath: "bounds", options: NSKeyValueObservingOptions([.New, .Old]) , context: nil)
        
        
        self .addObserver(self, forKeyPath: "titleLabel.text", options: NSKeyValueObservingOptions([.New, .Old]) , context: nil)
        self .addObserver(self, forKeyPath: "titleLabel.font", options: NSKeyValueObservingOptions([.New, .Old]) , context: nil)
        
        
        self .addObserver(self, forKeyPath: "imageView", options: NSKeyValueObservingOptions([.New, .Old]) , context: nil)
        //self .addObserver(self, forKeyPath: "imageView.image", options: NSKeyValueObservingOptions([.New, .Old]) , context: nil)
        
        
        self .addObserver(self, forKeyPath: "gap", options: NSKeyValueObservingOptions([.New, .Old]) , context: nil)
    }
    
    func updateContentOffset(){
        let size    = self.bounds.size
        let width   = size.width
        let imgSize = self.imageView?.image?.size
        let imgWidth = imgSize?.width

        let titleSize = textSizeWithFont((self.titleLabel?.text)!, font: (self.titleLabel?.font)!)
        
        let titleWidth = titleSize.width
        let centerWidth = imgWidth! + titleWidth + gap
        
        var imgLeft:CGFloat = 0
        var titleLeft:CGFloat = 0
        
        // 计算left偏移量
        imgLeft = (width - centerWidth) / 2 + titleWidth + gap;
        titleLeft = (width - centerWidth) / 2 - imgWidth!;
    
        self.imageEdgeInsets = UIEdgeInsetsMake(0, imgLeft, 0, -imgLeft)
        self.titleEdgeInsets = UIEdgeInsetsMake(0, titleLeft, 0, -titleLeft)
    
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        self.updateContentOffset()
        
    }
    
    deinit
    {
        self.removeObserver(self, forKeyPath: "frame")
        self.removeObserver(self, forKeyPath: "bounds")
        
        self.removeObserver(self, forKeyPath: "titleLabel.text")
        self.removeObserver(self, forKeyPath: "titleLabel.font")
        
        self.removeObserver(self, forKeyPath: "imageView")
        //self.removeObserver(self, forKeyPath: "imageView.image")

        self.removeObserver(self, forKeyPath: "gap")
    }

}
