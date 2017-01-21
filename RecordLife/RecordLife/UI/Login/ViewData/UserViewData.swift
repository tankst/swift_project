//
//  UserViewData.swift
//  RecordLife
//
//  Created by 齐云 on 2016/12/27.
//  Copyright © 2016年 齐云猛. All rights reserved.
//

import UIKit
//import RealmSwift

class UserViewData: BaseViewData {

    internal static let share = UserViewData()
    
    
    fileprivate override init() {
        debugPrint("用户数据存储单例创建")
        
        
    }
    
    func save(username: String, password: String) {
//        let realm = RealmSwiftManager.share.getRealm(username: RealmName)
//        let result = realm.objects(UserData.self).filter("username = '\(username)'")
//        if result.count > 0 {    //数据存在直接跳过
//            return
//        }
//        let userInfo = UserData()
//        userInfo.username = username.hmac(algorithm: .SHA512, key: encryption_key)
//        userInfo.password = password.md5
//        try! realm.write {
//            realm.add(userInfo, update: true)
//        }
    }
    
    func select(username: String, success:(_ value: UserData) -> () ){
//        let realm = RealmSwiftManager.share.getRealm(username: RealmName)
//        let result = realm.objects(UserData.self).filter("username = '\(username)'")
//        if result.count == 0 {
//            alertViewController(title: "提示", message: "用户名不正确", style: .alert, action_title: ["确认"], action_style: [.default], alert_closue: { (index, action) in
//                
//            })
//            return
//        }
//        for (_, value) in result.enumerated() {
//            success(value)
//        }
    }
    
    
    
    
    
    
    
}
