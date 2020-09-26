//
//  ForgetUserIdTF.swift
//  Review
//
//  Created by 남오승 on 2020/09/16.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
extension ForgotUserIdVC: UITextFieldDelegate {
    
    //휴대폰 번호 작성 시 이벤트
    @objc func textFieldDidChange(textField: UITextField) {
        if textField == self.phoneNumberTF {
            if textField.text!.count > 0 {
                phoneNumberGL.isHidden = true
            }else {
                phoneNumberGL.isHidden = false
            }
        }else {
            if textField.text!.count > 0 {
                birthGL.isHidden = true
            }else {
                birthGL.isHidden = false
            }
        }
        self.nextStepSetting()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == self.phoneNumberTF {
            guard let currentText = textField.text as NSString? else {return true}
            let textString = currentText.replacingCharacters(in: range, with: string)
            if string.count > 1 { //비밀번호 입력 창 복사붙여넣기 방지
                return false
            }
            return textField.updatePhoneNumber(string, textString)
        }else {
            guard let currentText = textField.text as NSString? else {return true}
            let textString = currentText.replacingCharacters(in: range, with: string)
            if string.count > 1 { //비밀번호 입력 창 복사붙여넣기 방지
                return false
            }
            return textField.updateBirth(string, textString)
        }
    }
}

