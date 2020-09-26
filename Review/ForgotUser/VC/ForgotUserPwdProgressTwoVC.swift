//
//  ForgotUserPwdProgressTwoVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/18.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class ForgotUserPwdProgressTwoVC: UIViewController {

    @IBOutlet weak var certNotMatchGL: UILabel!
    @IBOutlet weak var nextWrap: UIView!
    
    @IBOutlet weak var certNumberWrap: UIView!
    
    @IBOutlet weak var certNumberGL: UILabel!
    @IBOutlet weak var certNumberTF: UITextField!
    
    @IBOutlet weak var certResetBtn: UIButton!
    
    @IBOutlet weak var certCompleteBtn: UIButton!
    var nextWrapHeight:CGFloat = 44.0

    var validationFlag:Bool = false
    var certNumber:Array<String> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegateInit()
        self.uiInit()
        self.keyboardInit()
    }
    
    func uiInit() {
        certNumberWrap.layer.borderWidth = 0.5
        certNumberWrap.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
    }
//
    func delegateInit() {
        self.certNumberTF.delegate = self
        self.certNumberTF.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }

    @IBAction func backBtn(_ sender: Any) {
         self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    //
    @IBAction func getCertificationNumberBtn(_ sender: Any) {
        
        if validationFlag {
////            userNotFoundGL.isHidden = false
            print("다음버튼")
        }else {
////            userNotFoundGL.isHidden = true
        }
    }
//
    func keyboardInit() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShowing),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    //키보드 높이 찾아주는 부분
    @objc func keyboardWillShowing(notification:NSNotification){
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary;
        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue;
        let keyboardHeight = keyboardRectangle.size.height;
        self.nextWrap.constraints.forEach { (constraint) in // ---- 3
            if constraint.firstAttribute == .height {
                constraint.constant = self.nextWrapHeight + keyboardHeight - 35.0
            }
        }
    }
    
    //키보드 숨겨질 때 이벤트
    @objc private func keyboardWillHide(_ notification: Notification) {
        nextWrap.constraints.forEach { (constraint) in // ---- 3
            if constraint.firstAttribute == .height {
                constraint.constant = nextWrapHeight
            }
        }
    }
//
    func certCheck() {
        if certNumberTF.text!.count == 8 {
            certResetBtn.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
            certResetBtn.setTitleColor(.black, for: .normal)
            
            certCompleteBtn.backgroundColor = .black
            certCompleteBtn.setTitleColor(.white, for: .normal)
        }else {
            certCompleteBtn.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
            certCompleteBtn.setTitleColor(.black, for: .normal)
            
            certResetBtn.backgroundColor = .black
            certResetBtn.setTitleColor(.white, for: .normal)
        }
    }
    //번호 다시 입력하기
    @IBAction func certResetBtn(_ sender: Any) {
        
    }
    //인증 번호 입력 완료
    @IBAction func certCompleteBtn(_ sender: Any) {
        
    }
}
