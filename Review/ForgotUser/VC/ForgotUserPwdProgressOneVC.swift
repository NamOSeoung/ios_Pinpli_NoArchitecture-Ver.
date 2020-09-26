//
//  ForgotUserPwdProgressOneVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/18.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class ForgotUserPwdProgressOneVC: UIViewController {

    @IBOutlet weak var getCertNumberWrap: UIView!
    
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var phoneNumberGL: UILabel!
    
    @IBOutlet weak var phoneWrap: UIView!
    
    var certNumberWrapHeight:CGFloat = 44.0

    @IBOutlet weak var getCertificationNumberBtn: UIButton!
    @IBOutlet weak var phoneFormattingGL: UILabel!

    var validationFlag:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegateInit()
        self.uiInit()
        self.keyboardInit()
    }
    
    func uiInit() {
        phoneWrap.layer.borderWidth = 0.5
        phoneWrap.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
    }
//    
    func delegateInit() {
        self.phoneNumberTF.delegate = self
        self.phoneNumberTF.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    @IBAction func backBtn(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
//    
    @IBAction func getCertificationNumberBtn(_ sender: Any) {
        if validationFlag {
            let forgotUserPwdProgressTwoVC = forgotUserInfoStoryBoard.instantiateViewController(withIdentifier: "ForgotUserPwdProgressTwoVC") as! ForgotUserPwdProgressTwoVC
            self.present(forgotUserPwdProgressTwoVC, animated: false, completion: nil)
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
        self.getCertNumberWrap.constraints.forEach { (constraint) in // ---- 3
            if constraint.firstAttribute == .height {
                constraint.constant = self.certNumberWrapHeight + keyboardHeight - 35.0
            }
        }
    }
    
    //키보드 숨겨질 때 이벤트
    @objc private func keyboardWillHide(_ notification: Notification) {
        getCertNumberWrap.constraints.forEach { (constraint) in // ---- 3
            if constraint.firstAttribute == .height {
                constraint.constant = certNumberWrapHeight
            }
        }
    }
//    
    func getCertNumber() {
        if phoneNumberTF.text!.count == 13 {
            let number = phoneNumberTF.text!.prefix(3)
            if number != "010" {
                phoneFormattingGL.isHidden = false
                validationFlag = false
            }else {
                validationFlag = true
                phoneFormattingGL.isHidden = true
                getCertificationNumberBtn.setTitleColor(.white, for: .normal)
                           getCertificationNumberBtn.backgroundColor = .black
            }
        }else {
            phoneFormattingGL.isHidden = true
            validationFlag = false
            getCertificationNumberBtn.backgroundColor = .white
            getCertificationNumberBtn.setTitleColor(UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1), for: .normal)
        }
    }
}
