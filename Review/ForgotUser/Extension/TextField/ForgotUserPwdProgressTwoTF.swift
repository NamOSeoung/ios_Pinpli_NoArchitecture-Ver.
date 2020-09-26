//
//  ForgotUserPwdProgressTwoTF.swift
//  Review
//
//  Created by 남오승 on 2020/09/18.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
extension ForgotUserPwdProgressTwoVC: UITextFieldDelegate {
    
    //휴대폰 번호 작성 시 이벤트
    @objc func textFieldDidChange(textField: UITextField) {
        if textField.text!.count > 0 {
            self.certNumberGL.isHidden = true
        }else {
            self.certNumberGL.isHidden = false
        }
        
        self.certCheck()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text as NSString? else {return true}
        let textString = currentText.replacingCharacters(in: range, with: string)
        if string.count > 1 { //비밀번호 입력 창 복사붙여넣기 방지
            return false
        }      
        return textField.certNumber(string, textString)
    }
}

