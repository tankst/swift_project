//
//  LocationManager.swift
//  RecordLife
//
//  Created by 齐云 on 2017/1/20.
//  Copyright © 2017年 齐云猛. All rights reserved.
//

import UIKit
import CoreLocation


class LocationManager: NSObject, CLLocationManagerDelegate {
    
    internal static let share = LocationManager()
    
    var cityName = "北京"
    
    
    let locationManager = CLLocationManager()
    
    func start() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //设置定位精度
        locationManager.distanceFilter = 100  //更新距离
        locationManager.requestAlwaysAuthorization()  //发送授权
        if CLLocationManager.locationServicesEnabled() {
            //允许的话,开启定位
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locations = locations.last else { return }
        CLGeocoder().reverseGeocodeLocation(locations) { (pms, erroe) in
            if let placeMark = pms?.last {
                manager.stopUpdatingLocation()
                let name = placeMark.name
                let locality = placeMark.locality
                self.cityName = placeMark.locality!
                debugPrint(name!, locality!)
            }
        }
    }
    
    
    
    

}
