//
//  ForgotUserIdVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/15.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class ForgotUserIdVC: UIViewController {
    @IBOutlet weak var phoneWrap: UIView!
    
    @IBOutlet weak var birthWrap: UIView!
    
    @IBOutlet weak var nextStepRootWrap: UIView!
    @IBOutlet weak var nextStepWrap: UIView!
    
    @IBOutlet weak var nextStepBtn: UIButton!
    var nextStepRootWrapHeight:CGFloat = 44.0

    //phoneNumberGuideLabel
    @IBOutlet weak var phoneNumberGL: UILabel!
    @IBOutlet weak var phoneNumberTF: UITextField!
    
    //birthGuideLabel
    @IBOutlet weak var birthGL: UILabel!
    @IBOutlet weak var birthTF: UITextField!
    
    var keyboardHeight:CGFloat = 0.0
    
    //휴대폰 번호 찌우는 이벤트
    var deleteEventFlag:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegateInit()
        self.uiInit()
        self.keyboardInit()
    }
    
    func delegateInit() {
        self.phoneNumberTF.delegate = self
        //텍스트 필드 입력 시 이벤트 발생
        phoneNumberTF.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        self.birthTF.delegate = self
        birthTF.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
    }
    
    func uiInit() {
        phoneWrap.layer.borderWidth = 0.5
        phoneWrap.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        
        birthWrap.layer.borderWidth = 0.5
        birthWrap.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
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
    
    func nextStepSetting() {
        if phoneNumberTF.text!.count == 13 {
            if birthTF.text!.count == 10 {
                nextStepBtn.setTitleColor(.white, for: .normal)
                nextStepBtn.backgroundColor = .black
            }else {
                nextStepBtn.backgroundColor = .white
                nextStepBtn.setTitleColor(UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1), for: .normal)
            }
        }else {
            nextStepBtn.backgroundColor = .white
            nextStepBtn.setTitleColor(UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //입력 텍스트 밖 영역 클릭시 키보드 내려가도록 해주는 함수
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    
    //다음단계로 넘어가기
    @IBAction func nextStepBtn(_ sender: Any) {
        if phoneNumberTF.text!.count == 13 {
            if birthTF.text!.count == 10 {
//                let notFoundUserIdVC = forgotUserInfoStoryBoard.instantiateViewController(withIdentifier: "NotFoundUserIdVC") as! NotFoundUserIdVC
//                self.present(notFoundUserIdVC, animated: true, completion: nil)
                
                let foundUserIdVC = forgotUserInfoStoryBoard.instantiateViewController(withIdentifier: "FoundUserIdVC") as! FoundUserIdVC
                self.present(foundUserIdVC, animated: true, completion: nil)
            }
        }
    }
}



