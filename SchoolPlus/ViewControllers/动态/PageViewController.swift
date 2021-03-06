//
//  PageViewController.swift
//  SchoolPlus
//
//  Created by 金含霖 on 2020/8/25.
//  Copyright © 2020 金含霖. All rights reserved.
//

import UIKit

public enum UserAction: Int {
    case none = 0
    case tap = 1
    case swipe = 2
}

class PageViewController: UIViewController,UIPageViewControllerDelegate {
    var scrollView = UIScrollView()
    let allButton = UIButton()
    let subButton = UIButton()
    var vc : [UIViewController] = [AllMessagesViewController(),SubscribeMessageViewController()]
    var tabView = UIView()
    var tabHeight = CGFloat(100)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubView()
    }

    func initSubView() {
        let pageWidth = self.view.bounds.width
        let pageHeight = self.view.bounds.height
        
        tabView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: tabHeight)
        tabView.backgroundColor = UIColor.white
        self.view.addSubview(tabView)
        tabView.addSubview(allButton)
        tabView.addSubview(subButton)
        
        allButton.setTitle("学院广场", for: .normal)
        subButton.setTitle("我的关注", for: .normal)
        allButton.setTitleColor(UIColor.black, for: .normal)
        allButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        subButton.setTitleColor(UIColor.darkGray, for: .normal)
        subButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        allButton.snp.makeConstraints({
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.width.equalTo(self.view.bounds.width/2)
            $0.height.equalTo(55)
        })
        subButton.snp.makeConstraints({
             $0.bottom.equalToSuperview()
             $0.right.equalToSuperview()
             $0.width.equalTo(self.view.bounds.width/2)
             $0.height.equalTo(55)
         })
        
        var m = 0
        self.view.addSubview(scrollView)
        scrollView.frame = CGRect(x: 0, y: 44, width: pageWidth, height: (self.view.bounds.height-44))
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
        scrollView.contentSize = CGSize(width: pageWidth * CGFloat(vc.count), height: pageHeight-tabHeight)
        for i in vc{
            i.view.frame = CGRect(x: pageWidth * CGFloat(m),y: 44, width: pageWidth, height: pageHeight-tabHeight)
            self.scrollView.addSubview(i.view)
            self.addChild(i)
            m += 1
        }
        
    }
    
}

extension PageViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x > 10 {
            self.subButton.setTitleColor(UIColor.black, for: .normal)
            subButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            allButton.setTitleColor(UIColor.darkGray, for: .normal)
            allButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        } else {
            self.allButton.setTitleColor(UIColor.black, for: .normal)
            allButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            subButton.setTitleColor(UIColor.darkGray, for: .normal)
            subButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        }
    }
}


