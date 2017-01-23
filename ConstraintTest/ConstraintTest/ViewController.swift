//
//  ViewController.swift
//  ConstraintTest
//  学习添加约束
//  Created by SevenWang on 2017/1/23.
//  Copyright © 2017年 SevenWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    var topview:UIView!
    var leftview:UIView!
    var rightview:UIView!
    var bottomview:UIView!
    
    //MARK:设置视图
    func setView() -> () {
        topview = UIView.init()
        topview.backgroundColor = UIColor.red
        self.view.addSubview(topview)
        self.topviewAddConstraints()
        
        bottomview = UIView.init()
        bottomview.backgroundColor = UIColor.blue
        self.view.addSubview(bottomview)
        self.bottomviewAddConstraints()
        
        leftview = UIView.init()
        leftview.backgroundColor = UIColor.yellow
        self.view.addSubview(leftview)
        self.leftviewAddConstraints()
        
        rightview = UIView.init()
        rightview.backgroundColor = UIColor.green
        self.view.addSubview(rightview)
        self.rightviewAddConstraints()
    }
    
    //MARK:添加约束
    func topviewAddConstraints() -> () {
        //系统会默认给autoresizing 约束
        // 关闭autoresizing 就不会显示
        topview.translatesAutoresizingMaskIntoConstraints = false
        
        //宽度约束 === PS：除了宽高上的约束是加给自己的，其他的约束都是加在父视图上的
        let wConstrain = NSLayoutConstraint.init(item: topview, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 200)
        topview.addConstraint(wConstrain) //自己添加约束
        //高度约束
        let hConstrain = NSLayoutConstraint.init(item: topview, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 44)
        topview.addConstraint(hConstrain) //自己添加约束
        
        //水平居中约束 ==== PS：有参照物（toItem）的时候multiplier必须等于1
        let centerHConstrain = NSLayoutConstraint.init(item: topview, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
        topview.superview?.addConstraint(centerHConstrain) //父视图添加约束
        
        //顶部约束
        let topConstrain = NSLayoutConstraint.init(item: topview, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 60)
        topview.superview?.addConstraint(topConstrain) //父视图添加约束
    }
    
    func bottomviewAddConstraints() -> () {
        bottomview.translatesAutoresizingMaskIntoConstraints = false
        
        //宽度约束
        let wConstrain = NSLayoutConstraint.init(item: bottomview, attribute: .width, relatedBy: .equal, toItem: topview, attribute: .width, multiplier: 1.0, constant: 0)
        bottomview.superview?.addConstraint(wConstrain) //自己添加约束
        
        //高度约束
        let hConstrain = NSLayoutConstraint.init(item: bottomview, attribute: .height, relatedBy: .equal, toItem: topview, attribute: .height, multiplier: 1.0, constant: 0)
        bottomview.superview?.addConstraint(hConstrain) //自己添加约束
        
        //左边约束
        let leftConstrain = NSLayoutConstraint.init(item: bottomview, attribute: .leading, relatedBy: .equal, toItem: topview, attribute: .leading, multiplier: 1.0, constant: 0)
        bottomview.superview?.addConstraint(leftConstrain) //父视图添加约束
        
        //下边约束 ===PS:在参照物前面的时候constant为负值
        let bottomConstrain = NSLayoutConstraint.init(item: bottomview, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -60)
        bottomview.superview?.addConstraint(bottomConstrain) //父视图添加约束
    }
    
    func leftviewAddConstraints() -> () {
        leftview.translatesAutoresizingMaskIntoConstraints = false
        
        //左边约束
        let leftConstrain = NSLayoutConstraint.init(item: leftview, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 12)
        leftview.superview?.addConstraint(leftConstrain) //父视图添加约束
        
        //右边约束
        let rightConstrain = NSLayoutConstraint.init(item: leftview, attribute: .trailing, relatedBy: .equal, toItem: topview, attribute: .leading, multiplier: 1.0, constant: -12)
        leftview.superview?.addConstraint(rightConstrain) //父视图添加约束
        
        //上边约束
        let topConstrain = NSLayoutConstraint.init(item: leftview, attribute: .top, relatedBy: .equal, toItem: topview, attribute: .bottom, multiplier: 1.0, constant: 0)
        leftview.superview?.addConstraint(topConstrain) //父视图添加约束
        
        //下边约束
        let bottomConstrain = NSLayoutConstraint.init(item: leftview, attribute: .bottom, relatedBy: .equal, toItem: bottomview, attribute: .top, multiplier: 1.0, constant: 0)
        leftview.superview?.addConstraint(bottomConstrain) //父视图添加约束
    }
    
    func rightviewAddConstraints() -> () {
        rightview.translatesAutoresizingMaskIntoConstraints = false
        
        //左边约束
        let leftConstrain = NSLayoutConstraint.init(item: rightview, attribute: .leading, relatedBy: .equal, toItem: topview, attribute: .trailing, multiplier: 1.0, constant: 12)
        rightview.superview?.addConstraint(leftConstrain) //父视图添加约束
        
        //右边约束
        let rightConstrain = NSLayoutConstraint.init(item: rightview, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -12)
        rightview.superview?.addConstraint(rightConstrain) //父视图添加约束
        
        //上边约束
        let topConstrain = NSLayoutConstraint.init(item: rightview, attribute: .top, relatedBy: .equal, toItem: leftview, attribute: .top, multiplier: 1.0, constant: 0)
        rightview.superview?.addConstraint(topConstrain) //父视图添加约束
        
        //高度约束
        let hConstrain = NSLayoutConstraint.init(item: rightview, attribute: .height, relatedBy: .equal, toItem: leftview, attribute: .height, multiplier: 1.0, constant: 0)
        rightview.superview?.addConstraint(hConstrain) //自己添加约束
        
    }

    
}

