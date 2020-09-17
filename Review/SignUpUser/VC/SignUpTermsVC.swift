//
//  SignUpTermsVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/17.
//  Copyright © 2020 nam_os. All rights reserved.
//
import UIKit

class SignUpTermsVC: UIViewController {

    @IBOutlet weak var serviceTermsWrap: UIView!
    @IBOutlet weak var userInfoTermsWrap: UIView!
    @IBOutlet weak var serviceAgreeBtn: UIButton!
    @IBOutlet weak var userInfoAgreeBtn: UIButton!
    @IBOutlet weak var nextStepBtn: UIButton!
    @IBOutlet weak var allAgreeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
 
        //뷰 클릭 시 실행되는 이벤트를위한 세팅작업
        serviceTermsWrap.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(termsSelected)))
        userInfoTermsWrap.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(termsSelected)))
    }
    
    @objc func termsSelected(_ gesture : UITapGestureRecognizer){
        let view = gesture.view!
        let tag = view.tag
        if tag == 0 {
            serviceAgreeBtn.backgroundColor = .black
            serviceTermsWrap.tag = 2
        }else if tag == 2 {
            serviceAgreeBtn.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
            serviceTermsWrap.tag = 0
        }else if tag == 1 {
            userInfoAgreeBtn.backgroundColor = .black
            userInfoTermsWrap.tag = 3
        }else {
            userInfoAgreeBtn.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
            userInfoTermsWrap.tag = 1
        }
        allAgreeCheck()
    }
    
    func allAgreeCheck(){
        if serviceTermsWrap.tag == 2 && userInfoTermsWrap.tag == 3 {
            allAgreeBtn.setTitleColor(.black, for: .normal)
            allAgreeBtn.tag = 1
            nextStepBtn.setTitleColor(.white, for: .normal)
            nextStepBtn.backgroundColor = .black
        }else {
            allAgreeBtn.setTitleColor(UIColor(red: 0.8, green: 0.8, blue: 0.769, alpha: 1), for: .normal)
            allAgreeBtn.tag = 0
            nextStepBtn.setTitleColor(UIColor(red: 0.8, green: 0.8, blue: 0.769, alpha: 1), for: .normal)
            nextStepBtn.backgroundColor = .white
        }
    }
    
    //전체 동의하기
    @IBAction func allAgreeBtn(_ sender: UIButton) {
        let tag = sender.tag
        if tag == 0 {
            serviceAgreeBtn.backgroundColor = .black
            userInfoAgreeBtn.backgroundColor = .black
            serviceTermsWrap.tag = 2
            userInfoTermsWrap.tag = 3
            allAgreeBtn.setTitleColor(.black, for: .normal)
            nextStepBtn.setTitleColor(.white, for: .normal)
            nextStepBtn.backgroundColor = .black
            sender.tag = 1
        }else {
            serviceAgreeBtn.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
            userInfoAgreeBtn.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
            serviceTermsWrap.tag = 0
            userInfoTermsWrap.tag = 1
            allAgreeBtn.setTitleColor(UIColor(red: 0.8, green: 0.8, blue: 0.769, alpha: 1), for: .normal)
            nextStepBtn.setTitleColor(UIColor(red: 0.8, green: 0.8, blue: 0.769, alpha: 1), for: .normal)
            nextStepBtn.backgroundColor = .white
            sender.tag = 0
        }
    }
    
    @IBAction func nextStepBtn(_ sender: UIButton) {
        //전체 동의를 해야 넘어갈 수 있음.
        if serviceTermsWrap.tag == 2 && userInfoTermsWrap.tag == 3 {
            let signUpPhoneWriteVC = signUpStoryBoard.instantiateViewController(withIdentifier: "SignUpPhoneWriteVC") as! SignUpPhoneWriteVC
            self.present(signUpPhoneWriteVC, animated: false, completion: nil)
        }
    }
    
    //뒤로가기
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}




