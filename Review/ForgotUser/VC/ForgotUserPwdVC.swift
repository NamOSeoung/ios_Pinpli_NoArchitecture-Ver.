//
//  ForgotUserPwdVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/18.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class ForgotUserPwdVC: UIViewController {
    
    //userNotFoundGuideLabel
    @IBOutlet weak var userNotFoundGL: UILabel!
    //userIdGuideLabel
    @IBOutlet weak var userIdGL: UILabel!
    @IBOutlet weak var phoneNumberGL: UILabel!
    @IBOutlet weak var nextStepBtn: UIButton!
    @IBOutlet weak var userIdTF: UITextField!
    @IBOutlet weak var nextStepRootWrap: UIView!
    var nextStepRootWrapHeight:CGFloat = 44.0
    
    @IBOutlet weak var userIdWrap: UIView!
    
    @IBOutlet weak var phoneNumberWrap: UIView!
    @IBOutlet weak var phoneNumberTF: UITextField!
    var validationFlag:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegateInit()
        self.uiInit()
        self.keyboardInit()
    }
    
    func uiInit() {
        userIdWrap.layer.borderWidth = 0.5
        userIdWrap.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        
        phoneNumberWrap.layer.borderWidth = 0.5
        phoneNumberWrap.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
    }
    
    func delegateInit() {
        self.userIdTF.delegate = self
        //텍스트 필드 입력 시 이벤트 발생
        userIdTF.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        self.phoneNumberTF.delegate = self
        phoneNumberTF.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
    }
    @IBAction func backBtn(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextStepBtn(_ sender: Any) {
        
        if validationFlag {
            let forgotUserPwdProgressOneVC = forgotUserInfoStoryBoard.instantiateViewController(withIdentifier: "ForgotUserPwdProgressOneVC") as! ForgotUserPwdProgressOneVC
            self.present(forgotUserPwdProgressOneVC, animated: false, completion: nil)
        }
    }
    
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
        self.nextStepRootWrap.constraints.forEach { (constraint) in // ---- 3
            if constraint.firstAttribute == .height {
                constraint.constant = self.nextStepRootWrapHeight + keyboardHeight - 35.0
                print(constraint.constant)
            }
        }
    }
    
    //키보드 숨겨질 때 이벤트
    @objc private func keyboardWillHide(_ notification: Notification) {
        nextStepRootWrap.constraints.forEach { (constraint) in // ---- 3
            if constraint.firstAttribute == .height {
                constraint.constant = nextStepRootWrapHeight
            }
        }
    }
    
    func nextStepSetting() {
        if phoneNumberTF.text!.count == 13 {
            if userIdTF.isValidEmail(srt: userIdTF.text!) { //이메일 validation check
                validationFlag = true
                nextStepBtn.setTitleColor(.white, for: .normal)
                nextStepBtn.backgroundColor = .black
            }else {
                validationFlag = false
                nextStepBtn.backgroundColor = .white
                nextStepBtn.setTitleColor(UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1), for: .normal)
            }
        }else {
            validationFlag = false
            nextStepBtn.backgroundColor = .white
            nextStepBtn.setTitleColor(UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1), for: .normal)
        }
    }
}
