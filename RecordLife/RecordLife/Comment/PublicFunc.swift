//
//  PublicFunc.swift
//  IOVS
//
//  Created by 齐云 on 2016/11/1.
//  Copyright © 2016年 AKASHA. All rights reserved.
//

import Foundation
import UIKit

//打印
func Q_Log<T>(message : T, file : String = #file, lineNumber : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        print("[\(fileName):line:\(lineNumber)]- \(message)")
        
    #endif
}

//获取控制器
func getCurrentVC()->UIViewController?{
    var result:UIViewController?
    var window = UIApplication.shared.keyWindow
    if window?.windowLevel != UIWindowLevelNormal{
        let windows = UIApplication.shared.windows
        for tmpWin in windows{
            if tmpWin.windowLevel == UIWindowLevelNormal{
                window = tmpWin
                break
            }
        }
    }
    let fromView = window?.subviews[0]
    if let nextRespnder = fromView?.next{
        if nextRespnder is UIViewController{
            result = nextRespnder as? UIViewController
        }else{
            result = window?.rootViewController
        }
    }
    return result
}

//根据字符转计算长度
func Q_getTextRectSize(text:String,font:UIFont,size:CGSize) -> CGRect {
    let attributes = [NSFontAttributeName: font]
    let option = NSStringDrawingOptions.usesLineFragmentOrigin
    let rect:CGRect = text.boundingRect(with: size, options: option, attributes: attributes, context: nil)
    return rect;
}

//根据类名生成类
func Q_addChildViewController(_ childControllerName : String) ->UIViewController? {
    // 1.获取命名空间
    guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
        Q_Log(message: "命名空间不存在")
        return nil
    }
    // 2.通过命名空间和类名转换成类
    let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + childControllerName)
    // swift 中通过Class创建一个对象,必须告诉系统Class的类型
    guard let clsType = cls as? UIViewController.Type else {
        Q_Log(message: "无法转换成UIViewController")
        return nil
    }
    // 3.通过Class创建对象
    let childController = clsType.init()
    return childController
}

//视图圆角
func Q_viewFillet(view: UIView ,redius: CGFloat) {
    view.layer.cornerRadius = redius
    view.layer.masksToBounds = true
}

//视图边框
func Q_viewBord(view: UIView, borderWidth: CGFloat, borderColor: String) {
    view.layer.borderWidth = borderWidth
    view.layer.borderColor = UIColor(hexString: borderColor)?.cgColor
}

//视图圆角加边框
func Q_viewFilletAndBord(view: UIView, redius: CGFloat, borderWidth: CGFloat, borderColor: String) {
    Q_viewFillet(view: view, redius: redius)
    view.layer.borderWidth = borderWidth
    view.layer.borderColor = UIColor(hexString: borderColor)?.cgColor
}

//视图周边阴影
func Q_viewShadow(view: UIView, opacity: Float, shadowColor: String){
    view.layer.shadowOpacity = opacity
    view.layer.shadowColor = UIColor(hexString: shadowColor)?.cgColor
    view.layer.shadowOffset = CGSize(width: 1, height: 1)
}

//视图旋转
func Q_viewRorate(view: UIView, angle: CGFloat) {
    view.transform = CGAffineTransform.init(rotationAngle: angle)
}

//视图转换成图片
func Q_customSnapshoFromView(view: UIView) -> UIImageView {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0)
    view.layer.render(in: UIGraphicsGetCurrentContext()!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    let snapshot = UIImageView(image: image)
    snapshot.layer.masksToBounds = false
    snapshot.layer.cornerRadius = 0
    snapshot.layer.shadowOffset = CGSize(width: -0.5, height: 0)
    snapshot.layer.shadowRadius = 5.0
    snapshot.layer.shadowOpacity = 0.4
    return snapshot
}

func alertViewController(title: String, message: String?, style: UIAlertControllerStyle, action_title: [String]?, action_style: [UIAlertActionStyle]?, alert_closue:@escaping (_ index: Int, _ alertAction: UIAlertAction ) -> Void) {
    let alertVC = UIAlertController(title: title, message: message, preferredStyle: style)
    if  let action_title = action_title, let action_style = action_style {
        for (i, value) in action_title.enumerated() {
            let action = UIAlertAction(title: value, style: action_style[i], handler: { (action) in
                alert_closue(i, action)
            })
            alertVC.addAction(action)
        }
    }
    getCurrentVC()?.present(alertVC, animated: true, completion: {})
}






