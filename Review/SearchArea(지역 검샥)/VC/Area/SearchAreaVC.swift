//
//  SearchAreaVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/23.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SearchAreaVC: UIViewController, CLLocationManagerDelegate {

    //지역 리스트 감싸는 뷰
    @IBOutlet weak var areaWrap: UIView!
    
    //서울, 경기등..
    @IBOutlet weak var areaTV: UITableView!
    
    //성북구, 강북구 등..
    @IBOutlet weak var areaDetailTV: UITableView!
    
    var areaHeaderCell : AreaHeaderCell?
    
    var areaDetailCell : AreaDetailCell?
    
    @IBOutlet weak var currentLocationWrap: UIView!
    
    var areaHeaderData : AreaInfoReturn?
    
    var areaDetailData : AreaInfoReturn?
    
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var searchKeywordWrap: UIView!
    @IBOutlet weak var keywordTF: UITextField!
    @IBOutlet weak var keywordGL: UILabel!
    @IBOutlet weak var searchKeywordTV: UITableView!
    
    var areaHeader:String = ""
    var areaSuggestList:Array<String> = []
    var searchKeywordList:Array<String> = []
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        areaTV.delegate = self
        areaTV.dataSource = self
        areaTV.backgroundColor = .white
        
        areaDetailTV.delegate = self
        areaDetailTV.dataSource = self
        areaDetailTV.backgroundColor = .white

        areaWrap.layer.borderWidth = 0.5
        areaWrap.layer.borderColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
        
        currentLocationWrap.layer.addBorder([.top], color: UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1), width: 0.5)
        
        getAreaHeader(callingView: self as Any)
        
        //뷰 클릭 시 실행되는 이벤트를위한 세팅작업
        currentLocationWrap.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(getCurrentLocation)))
        
        searchKeywordTV.delegate = self
        searchKeywordTV.dataSource = self
        searchKeywordTV.backgroundColor = .white
        
        keywordTF.delegate = self
        keywordTF.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        getAreaSuggest(callingView: self as Any)
    }
    
    @objc func getCurrentLocation() {
        locationManager.requestWhenInUseAuthorization()
        
        /* 위치정보를 자동업데이트를 하기위해서 필요한 부분

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        */
        //수동업데이트
        guard let locValue: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
        getLocationToAddressKakao(callingView: self as Any, longitude: locValue.longitude, latitude: locValue.latitude)
    }
    
    
    //검색결과 이동
    func searchResultMove(keyword:String){
        guard let searchResultVC = searchAreaStoryBoard .instantiateViewController(withIdentifier: "SearchResultVC") as? SearchResultVC else { //storyboardId가 signActivity인 스토리 보드로 화면 전환
                  return
        }
        searchResultVC.searchKeyword = keyword
        self.navigationController?.pushViewController(searchResultVC ,animated:true )
    }
    //위치 자동검색용
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        //위치가 업데이트될때마다 호출함.
//        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
//    }
    
    func viewInit() {
        if keywordTF.text!.count > 0 {
            keywordGL.isHidden = true
            searchKeywordWrap.isHidden = false
            deleteBtn.constraints[1].constant = 41.0
            deleteBtn.isHidden = false
            searchKeywordList.removeAll()
            
            for keyword in areaSuggestList {
                if keyword.contains(keywordTF.text!) {
                    searchKeywordList.append(keyword)
                }
            }
            DispatchQueue.main.async {
                self.searchKeywordTV.reloadData()
            }
            
//            getRealtimeKeyword(callingView: self as Any, keyword: keywordTF.text!)
        }else {
            keywordGL.isHidden = false
            searchKeywordWrap.isHidden = true
            deleteBtn.constraints[1].constant = 0.0
            deleteBtn.isHidden = true
        }
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        keywordTF.text = ""
        self.viewInit()
    }
}
