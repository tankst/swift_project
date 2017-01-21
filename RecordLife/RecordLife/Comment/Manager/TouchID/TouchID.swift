//
//  Login_TouchID.swift
//  RecordLife
//
//  Created by 齐云 on 2016/12/26.
//  Copyright © 2016年 齐云猛. All rights reserved.
//

import UIKit
import LocalAuthentication

class TouchID: NSObject {

    internal static let share = TouchID()
    
    override init() {
        debugPrint("单例创建")
    }
    
    func touch_id(success_close:@escaping () -> ())  {
        if #available(iOS 8.0, *) {
            let context = LAContext()
            var error: NSError?
            let reasonString = "请验证已有指纹"
            if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error ) {
                context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString, reply: { (success, evalPolicyError) in
                    DispatchQueue.main.async(execute: { 
                        if success {
                            success_close()
                        }else {
                            debugPrint(evalPolicyError?.localizedDescription ?? "匹配失败")
                        }
                    })
                })
            }else {
                
                if #available(iOS 9.0, *) {
                    switch error?.code {
                    case LAError.authenticationFailed.rawValue?:
                        debugPrint("用户未能提供有效身份证件")
                        break
                    case LAError.userCancel.rawValue?:
                        debugPrint("用户取消认证")
                        break
                    case LAError.userFallback.rawValue?:
                        debugPrint("用户按了回退按钮")
                        break
                    case LAError.systemCancel.rawValue?:
                        debugPrint("系统取消")
                        break
                    case LAError.passcodeNotSet.rawValue?:
                        debugPrint("没有设置密码")
                        break
                    case LAError.touchIDNotAvailable.rawValue?:
                        debugPrint("触摸不可用")
                        break
                    case LAError.touchIDNotEnrolled.rawValue?:
                        debugPrint("你好没有保存TouchID指纹")
                        alertViewController(title: "提示", message: "设置TouchID", style: .alert, action_title: ["确认"], action_style: [.default], alert_closue: { (index, action) in
                            
                        })
                        break
                    case LAError.touchIDLockout.rawValue?:
                        debugPrint("TouchID 锁了")
                        break
                    case LAError.appCancel.rawValue?:
                        debugPrint("App取消认证")
                        break
                    case LAError.invalidContext.rawValue?:
                        debugPrint("")
                        break
                        
                    default:
                        debugPrint("touch 不可用")
                        break
                    }
                }else {
                    switch error?.code {
                    case LAError.authenticationFailed.rawValue?:
                        debugPrint("用户未能提供有效身份证件")
                        break
                    case LAError.userCancel.rawValue?:
                        debugPrint("用户取消认证")
                        break
                    case LAError.userFallback.rawValue?:
                        debugPrint("用户按了回退按钮")
                        break
                    case LAError.systemCancel.rawValue?:
                        debugPrint("系统取消")
                        break
                    case LAError.passcodeNotSet.rawValue?:
                        debugPrint("没有设置密码")
                        break
                    case LAError.touchIDNotAvailable.rawValue?:
                        debugPrint("触摸不可用")
                        break
                    case LAError.touchIDNotEnrolled.rawValue?:
                        debugPrint("你好没有保存TouchID指纹")
                        alertViewController(title: "提示", message: "设置TouchID", style: .alert, action_title: ["确认"], action_style: [.default], alert_closue: { (index, action) in
                            
                        })
                        break
                    default:
                        debugPrint("touch 不可用")
                        break
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    
    
}
