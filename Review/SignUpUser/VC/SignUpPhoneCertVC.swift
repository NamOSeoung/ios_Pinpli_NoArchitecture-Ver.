//
//  SignUpPhoneCertVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/17.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class SignUpPhoneCertVC: UIViewController {

    @IBOutlet weak var signUpPage: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
