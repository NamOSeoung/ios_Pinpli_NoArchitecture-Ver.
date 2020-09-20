//
//  TermsPopupVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/20.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class TermsPopupVC: UIViewController {

    @IBOutlet weak var termsTitleLabel: UILabel!
    //termsTextView
    @IBOutlet weak var termsTV: UITextView!
    //false : 서비스 이용약관 , true : 개인정보 처리방침
    var termsFlag:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        termsTV.backgroundColor = .white
        
        if termsFlag {
            termsTitleLabel.text = "개인정보 처리방침"
        }else {
            termsTitleLabel.text = "서비스 이용약관"
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}
