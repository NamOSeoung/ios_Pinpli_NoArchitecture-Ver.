//
//  SignUpPhoneWriteVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/17.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class SignUpPhoneWriteVC: UIViewController {
    
    @IBOutlet weak var phoneWrap: UIView!
    @IBOutlet weak var getCertWrap: UIView!
    @IBOutlet weak var getCertBtn: UIButton!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var phoneGL: UILabel!
    @IBOutlet weak var signUpPage: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiInit()
        delegateInit()
    }
    
    func uiInit() {
        phoneWrap.layer.borderWidth = 0.5
        phoneWrap.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
    }
//
    func delegateInit() {
        self.phoneTF.delegate = self
        self.phoneTF.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    //인증번호 받기
    @IBAction func getCertificationNumberBtn(_ sender: Any) {
        let signUpPhoneCertVC = signUpStoryBoard.instantiateViewController(withIdentifier: "SignUpPhoneCertVC") as! SignUpPhoneCertVC
        self.present(signUpPhoneCertVC, animated: false, completion: nil)
    }
    
}
