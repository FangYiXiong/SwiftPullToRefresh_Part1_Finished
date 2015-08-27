//
//  RefreshView.swift
//  PullToRefresh
//
//  Created by fang on 15/6/9.
//  Copyright (c) 2015年 Fang YiXiong. All rights reserved.
//

import UIKit

private let kSceneHeight: CGFloat = 120.0

class RefreshView: UIView, UIScrollViewDelegate {
    private unowned var scrollView: UIScrollView
    private var progress: CGFloat = 0.0
    
    init(frame: CGRect, scrollView: UIScrollView) {
        self.scrollView = scrollView
        super.init(frame: frame)
//        backgroundColor = UIColor.greenColor()
        updateBackgroundColor()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateBackgroundColor() {
        backgroundColor = UIColor(white: 0.7 * progress + 0.2, alpha: 1.0)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //1. 先拿到刷新视图可见区域的高度
        let refreshViewVisibleHeight = max(0, -scrollView.contentOffset.y - scrollView.contentInset.top)
        //2. 计算当前滚动的进度，范围是0-1
        progress = min(1, refreshViewVisibleHeight / kSceneHeight)
        //3. 根据进度来改变背景色
        updateBackgroundColor()
    }
    

}
