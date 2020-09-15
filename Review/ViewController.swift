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
        
        let forgotUserId = forgotUserInfoStoryBoard.instantiateViewController(withIdentifier: "ForgotUserId") as! ForgotUserId
        self.present(forgotUserId, animated: true, completion: nil)

    }
    
}

