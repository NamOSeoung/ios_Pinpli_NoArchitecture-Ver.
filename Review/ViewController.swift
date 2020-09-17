//
//  ViewController.swift
//  Review
//
//  Created by 남오승 on 2020/09/15.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func findIdBtn(_ sender: Any) {
        
        let forgotUserIdVC = forgotUserInfoStoryBoard.instantiateViewController(withIdentifier: "ForgotUserIdVC") as! ForgotUserIdVC
        self.present(forgotUserIdVC, animated: true, completion: nil)
        
//        let dragViewTest = forgotUserInfoStoryBoard.instantiateViewController(withIdentifier: "DragViewTest") as! DragViewTest
//        self.present(dragViewTest, animated: true, completion: nil)
        
        

    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        let signUpTermsVC = signUpStoryBoard.instantiateViewController(withIdentifier: "SignUpTermsVC") as! SignUpTermsVC
        self.present(signUpTermsVC, animated: true, completion: nil)
    }
}

