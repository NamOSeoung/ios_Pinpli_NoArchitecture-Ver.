//
//  HomeVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/21.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class HomeVC: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var homeStoreCV: UICollectionView!
    @IBOutlet weak var homeYoutubeCV: UICollectionView!
    @IBOutlet weak var homeNaverCV: UICollectionView!
    
    @IBOutlet weak var homeTstoryCV: UICollectionView!
    
    @IBOutlet weak var homeAppReviewCV: UICollectionView!
    
    @IBOutlet weak var locationWellcomeGL: UILabel!
    
    @IBOutlet weak var reviewGL: UILabel!
    
    var homeStoreCell : HomeStoreCell?
    var homeYoutubeCell : HomeYoutubeCell?
    var homeReviewCell : HomeReviewCell?
    
    let locationManager = CLLocationManager()
    
    var storeInfoReturn : StoreInfoReturn?
    var youtubeInfoReturn: ReviewModelReturnData?
    var naverInfoReturn: ReviewModelReturnData?
    var tistoryInfoReturn: ReviewModelReturnData?
    
    var currentAddress:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.homeStoreCV.register(UINib(nibName: "HomeStoreCell", bundle: nil), forCellWithReuseIdentifier: "HomeStoreCell")
        self.homeYoutubeCV.register(UINib(nibName: "HomeYoutubeCell", bundle: nil), forCellWithReuseIdentifier: "HomeYoutubeCell")
        self.homeNaverCV.register(UINib(nibName: "HomeReviewCell", bundle: nil), forCellWithReuseIdentifier: "HomeReviewCell")
        self.homeTstoryCV.register(UINib(nibName: "HomeReviewCell", bundle: nil), forCellWithReuseIdentifier: "HomeReviewCell")
        
        homeStoreCV.delegate = self
        homeStoreCV.dataSource = self
        homeStoreCV.backgroundColor = .white
        
        homeYoutubeCV.delegate = self
        homeYoutubeCV.dataSource = self
        homeYoutubeCV.backgroundColor = .white
        
        homeNaverCV.delegate = self
        homeNaverCV.dataSource = self
        homeNaverCV.backgroundColor = .white
        
        homeTstoryCV.delegate = self
        homeTstoryCV.dataSource = self
        homeTstoryCV.backgroundColor = .white
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        getCurrentLocation()
    }
    
    @IBAction func searchKeywordBtn(_ sender: Any) {
        let searchKeywordVC = searchAreaStoryBoard.instantiateViewController(withIdentifier: "SearchKeywordVC") as! SearchKeywordVC
        self.present(searchKeywordVC, animated: false, completion: nil)
    }
    
    func getCurrentLocation() {
        locationManager.requestWhenInUseAuthorization()
        
        /* 위치정보를 자동업데이트를 하기위해서 필요한 부분

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        */
        
        //수동 위치정보 호출
        guard let locValue: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
        getLocationToAddressKakao(callingView: self as Any, longitude: locValue.longitude, latitude: locValue.latitude)
    }
    
    func portalReviewMove(url:String) {
        let portalReviewWebviewVC = reviewsStoryBoard.instantiateViewController(withIdentifier: "PortalReviewWebviewVC") as! PortalReviewWebviewVC
            
        portalReviewWebviewVC.url = url
        self.present(portalReviewWebviewVC, animated: true, completion: nil)
    }
}
