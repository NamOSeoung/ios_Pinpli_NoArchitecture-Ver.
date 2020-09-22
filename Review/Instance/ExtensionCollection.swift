//
//  ExtensionCollection.swift
//  Review
//
//  Created by 남오승 on 2020/09/22.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

//scrollView 페이징처리 extension
extension UIScrollView {

    func scrollTo(horizontalPage: Int? = 0, verticalPage: Int? = 0, animated: Bool? = true) {
        var frame: CGRect = self.frame
        frame.origin.x = frame.size.width * CGFloat(horizontalPage ?? 0)
        frame.origin.y = frame.size.width * CGFloat(verticalPage ?? 0)
        self.scrollRectToVisible(frame, animated: animated ?? true)
    }

}

extension CALayer { //border 세팅을 위한 extension 으로 CALayer 확장
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            borderWidth = 0.0
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: deviceWidth, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - deviceWidth, width: deviceWidth, height: deviceWidth)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: deviceWidth, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - deviceWidth, y: 0, width: deviceWidth, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}

