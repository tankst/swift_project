//
//  Login_viewModel.swift
//  RecordLife
//
//  Created by 齐云 on 2016/12/26.
//  Copyright © 2016年 齐云猛. All rights reserved.
//

import UIKit

extension LoginViewController {
    func login(username: String?, password: String?, success: () -> () ) {
        if let username = username {
            UserViewData.share.select(username: username, success: { (value) in
                if password == value.password {
                    success()
                    debugPrint("登录成功")
                } else {
                    alertViewController(title: "提示", message: "密码错误", style: .alert, action_title: ["确定"], action_style: [.default], alert_closue: { (index, action) in
                        
                    })
                }
            })
        }
    }
}



extension UserData {
//    let <#name#> = <#value#>
    



}



