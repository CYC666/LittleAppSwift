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

// 代理方法
@objc protocol SelectColorViewControllerDelegate : NSObjectProtocol {
    
    // 点击了导航栏右边的确定按钮(默认是必须实现的，但是加上了optional，那就是可选的啦, 可选需要加上@objc，相对比较麻烦些)
    @objc optional func SelectColorViewControllerDone(R : CGFloat, G : CGFloat, B : CGFloat, A : CGFloat)
}

class SelectColorViewController: BaseViewController {

    // MARK:======================================属性========================================
    @IBOutlet weak var showView: UIView!
    
    // 显示色值区
    @IBOutlet weak var redNumberLabel: UILabel!
    @IBOutlet weak var greenNumberLabel: UILabel!
    @IBOutlet weak var blueNumberLabel: UILabel!
    @IBOutlet weak var alphaNumberLabel: UILabel!
    
    // 滑块区
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    // 色值
    var red : CGFloat = 255.0
    var green : CGFloat = 255.0
    var blue : CGFloat = 255.0
    var alpha : CGFloat = 100.0
    
    // 代理
    weak open var delegate : SelectColorViewControllerDelegate?
    
    
    
    // MARK:======================================生命周期========================================
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "取色板"
        
        // 阴影
        showView.layer.shadowRadius = 8
        showView.layer.shadowOffset = CGSize(width: 10, height: 10)
        showView.layer.shadowOpacity = 0.5
        showView.layer.shadowColor = UIColor(white: 0, alpha: 1).cgColor
        showView.layer.borderWidth = 0.5
        showView.layer.borderColor = UIColor(white: 0, alpha: 0.5).cgColor
        
        // 确定按钮
        let rightItem = UIBarButtonItem(title: "确定", style: UIBarButtonItemStyle.done, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = rightItem
        
        
        
    }
    
    
    // MARK:======================================私有方法========================================
    // MARK:色值改变，调节预览视图的颜色
    func colorChangeAction() {
        
        showView.backgroundColor = UIColor(red: CGFloat(red / 255.0),
                                           green: CGFloat(green / 255.0),
                                           blue: CGFloat(blue / 255.0),
                                           alpha: CGFloat(alpha / 100.0))
        
        redNumberLabel.text = NSString(format: "R:%.0f", red) as String
        greenNumberLabel.text = NSString(format: "G:%.0f", green) as String
        blueNumberLabel.text = NSString(format: "B:%.0f", blue) as String
        alphaNumberLabel.text = NSString(format: "A:%.0f", alpha) as String
        
    }
    
    
    
    // MARK:======================================响应区========================================
    @IBAction func redAction(_ sender: UISlider) {
        
        red = CGFloat(sender.value)
        colorChangeAction()
        
    }
    
    @IBAction func greenAction(_ sender: UISlider) {
        
        green = CGFloat(sender.value)
        colorChangeAction()
        
    }
    
    @IBAction func blueAction(_ sender: UISlider) {
        
        blue = CGFloat(sender.value)
        colorChangeAction()
        
    }

    @IBAction func alphaAvtion(_ sender: UISlider) {
        
        alpha = CGFloat(sender.value)
        colorChangeAction()
        
    }
    
    // MARK:确定按钮
    func doneAction() {
        
        // ? 替代了 responsed
        delegate?.SelectColorViewControllerDone!(R: CGFloat(red / 255.0), G: CGFloat(green / 255.0), B: CGFloat(blue / 255.0), A: CGFloat(alpha / 100.0))
        
    }
    
    
    // MARK:======================================代理方法========================================
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
