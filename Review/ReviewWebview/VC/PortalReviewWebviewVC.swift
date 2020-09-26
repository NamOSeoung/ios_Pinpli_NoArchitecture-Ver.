//
//  TestWebView.swift
//  Review
//
//  Created by 남오승 on 2020/09/26.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit
import WebKit

class PortalReviewWebviewVC: UIViewController {

    var url:String = ""
    
    @IBOutlet weak var urlWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: self.url)
        
        let request = URLRequest(url: url!)
        urlWebView.load(request)
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
