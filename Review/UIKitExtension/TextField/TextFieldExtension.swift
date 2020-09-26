//
//  TextFieldExtension.swift
//  Review
//
//  Created by 남오승 on 2020/09/16.
//  Copyright © 2020 nam_os. All rights reserved.
//
import UIKit

extension UITextField {
    //핸드폰 번호 formatting 용 extension
    func updatePhoneNumber(_ replacementString: String?, _ textString: String?) -> Bool {
        guard let textCount = textString?.count else {return true}
        guard let currentString = self.text else {return true}
        if replacementString == "" {
            return true
        } else if textCount == 4 {
            self.text =  currentString + "-"
        } else if textCount == 9 {
            self.text = currentString + "-"
        } else if textCount > 13 || replacementString == " " {
            return false
        }
        return true
    }
    
    //생년월일 formatting 용 extension
    func updateBirth(_ replacementString: String?, _ textString: String?) -> Bool {
        guard let textCount = textString?.count else {return true}
        guard let currentString = self.text else {return true}
        if replacementString == "" {
            return true
        } else if textCount == 5 {
            self.text =  currentString + "-"
        } else if textCount == 8 {
            self.text = currentString + "-"
        } else if textCount > 10 || replacementString == " " {
            return false
        }
        return true
    }
    //이메일 formatting 용 extension
    func isValidEmail(srt:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: srt)
    }
    //인증번호 formatting 용 extension
    func certNumber(_ replacementString: String?, _ textString: String?) -> Bool {
        guard let textCount = textString?.count else {return true}
        guard let currentString = self.text else {return true}
        
        if replacementString == "" {
            return true
        } else if textCount == 1 {
            self.text =  currentString + " "
        } else if textCount == 3 {
            self.text = currentString + " "
        } else if textCount == 5 {
            self.text = currentString + " "
        } else if textCount == 7 {
            self.text = currentString + " "
        }
        return true
    }
}

