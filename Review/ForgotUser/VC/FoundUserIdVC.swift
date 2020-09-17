//
//  FoundUserIdVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/15.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class FoundUserIdVC: UIViewController {
//    @IBOutlet weak var phoneWrap: UIView!
//
//    @IBOutlet weak var birthWrap: UIView!
//
//    @IBOutlet weak var nextStepWrap: UIView!
//
    var nextStepWrapHeight:CGFloat = 44.0
    
    @IBOutlet weak var forgetPwdWrap: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.uiInit()
//        self.keyboardInit()
        
    }
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //
    func uiInit() {
        forgetPwdWrap.layer.borderWidth = 0.5
        forgetPwdWrap.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        
    }
//    
//    func keyboardInit() {
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillShowing),
//            name: UIResponder.keyboardWillShowNotification,
//            object: nil
//        )
//        
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillHide(_:)),
//            name: UIResponder.keyboardWillHideNotification,
//            object: nil
//        )
//    }
//    
//    @IBAction func back(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//
//    //키보드 높이 찾아주는 부분
//    @objc func keyboardWillShowing(notification:NSNotification){
//        let userInfo:NSDictionary = notification.userInfo! as NSDictionary;
//        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
//        let keyboardRectangle = keyboardFrame.cgRectValue;
//        let keyboardHeight = keyboardRectangle.size.height;
//          
//        self.nextStepWrap.constraints.forEach { (constraint) in // ---- 3
//            if constraint.firstAttribute == .height {
//                constraint.constant = self.nextStepWrapHeight + keyboardHeight - 30.0
//                print(constraint.constant)
//            }
//        }
//        
//        
//        print(keyboardHeight)
//    }
//      
//      //키보드 숨겨질 때 이벤트
//    @objc private func keyboardWillHide(_ notification: Notification) {
//        nextStepWrap.constraints.forEach { (constraint) in // ---- 3
//            if constraint.firstAttribute == .height {
//                  constraint.constant = nextStepWrapHeight
//            }
//        }
//    }
}



