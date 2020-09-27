//
//  SearchKeywordVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/21.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class SearchKeywordVC: UIViewController {

    @IBOutlet weak var underLineView: UIView!
    @IBOutlet weak var scrollViewContainerViewWidth: NSLayoutConstraint!
    
    @IBOutlet weak var hotKeywordBtn: UIButton!
    //keywordGuideLabel
    @IBOutlet weak var keywordGL: UILabel!
    //keywordTextField
    @IBOutlet weak var keywordTF: UITextField!
    @IBOutlet weak var keywordBtnWrap: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var recentlyKeywordBtn: UIButton!
    
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var realtimekeywordWrap: UIView!
    //realtimeKeywordTableView
    @IBOutlet weak var realtimeKeywordTV: UITableView!
    var hotKeywordCell : HotKeywordCell?
    
    var realtimeKeyword:Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollViewContainerViewWidth.constant = UIScreen.main.bounds.size.width * 2
        
        keywordBtnWrap.layer.borderWidth = 0.5
        keywordBtnWrap.layer.borderColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
        
        realtimeKeywordTV.delegate = self
        realtimeKeywordTV.dataSource = self
        realtimeKeywordTV.backgroundColor = .white
        
        keywordTF.delegate = self
        keywordTF.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        realtimeKeywordTV.layer.addBorder([.top], color: UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1), width: 0.5)
        // Do any additional setup after loading the view.
    }
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func hotKeywordBtn(_ sender: Any) {
        self.scrollView.scrollTo(horizontalPage: 0, animated: true)
        
        UIView.animate(withDuration: 0.3) {
            self.underLineView.frame.origin.x = 0
        }
        
        hotKeywordBtn.setTitleColor(UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1), for: .normal)
        recentlyKeywordBtn.setTitleColor(UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1), for: .normal)
    }
    
    @IBAction func recentlyKeywordBtn(_ sender: Any) {
        self.scrollView.scrollTo(horizontalPage: 1, animated: true)
        hotKeywordBtn.setTitleColor(UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1), for: .normal)
        recentlyKeywordBtn.setTitleColor(UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1), for: .normal)
        
        UIView.animate(withDuration: 0.3) {
            self.underLineView.frame.origin.x = deviceWidth/2
        }
    }
    @IBAction func deletebtn(_ sender: Any) {
        keywordTF.text = ""
        self.viewInit()
    }
    
    func viewInit() {
        if keywordTF.text!.count > 0 {
            keywordGL.isHidden = true
            realtimekeywordWrap.isHidden = false
            deleteBtn.constraints[1].constant = 41.0
            deleteBtn.isHidden = false
            getRealtimeKeyword(callingView: self as Any, keyword: keywordTF.text!)
        }else {
            keywordGL.isHidden = false
            realtimekeywordWrap.isHidden = true
            deleteBtn.constraints[1].constant = 0.0
            deleteBtn.isHidden = true
        }
    }
}
