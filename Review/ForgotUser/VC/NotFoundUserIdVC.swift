//
//  NotFoundUserIdVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/15.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class NotFoundUserIdVC: UIViewController {

    var nextStepWrapHeight:CGFloat = 44.0
    
    //처음으로 돌아가기
    @IBOutlet weak var backToFirstWrap: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiInit()
    }
    
    func uiInit() {
        backToFirstWrap.layer.borderWidth = 0.5
        backToFirstWrap.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    //처음으로 돌아가기
    @IBAction func backToFirstBtn(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        let signUpTermsVC = signUpStoryBoard.instantiateViewController(withIdentifier: "SignUpTermsVC") as! SignUpTermsVC
        self.present(signUpTermsVC, animated: true, completion: nil)
    }
}



