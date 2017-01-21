//
//  BaseNavigation.swift
//  RecordLife
//
//  Created by 齐云 on 2016/12/26.
//  Copyright © 2016年 齐云猛. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class BaseNavigation: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //        UIApplication.shared.statusBarStyle = .lightContent
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override class func initialize() {
        
//        let navBar = UINavigationBar.appearance()
//
//        // 设置导航栏变得不透明 ， 使得视图的坐标的原点从导航栏下边缘开始，也可以设置背景图片达到这个效果
//        navBar.isTranslucent = true
//
//        navBar.titleTextAttributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 20),NSForegroundColorAttributeName:UIColor.black]
//        
//        // 设置导航栏背景颜色
//        
//        
//        
//        
//        
//        navBar.setBackgroundImage(UIImage.init(color: UIColor.init(hexString: "#fffff")!), for: .default)
//        
//        navBar.shadowImage = UIImage.init();
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if super.topViewController != nil && (super.topViewController?.isKind(of: viewController.classForCoder))! {
            return
        }
        super.pushViewController(viewController, animated: animated);
        let subVC:Bool = self.viewControllers.count > 1
        if subVC {
            let button = UIButton.init(type: .custom);
            button.frame = CGRect(x: 10, y: 7, width: 30, height: 30);
            button.addBlock(for: .touchUpInside, block: { [unowned self] (btn) in
                self.popViewController(animated: true)
            })
            
//            let _ = button.rx.controlEvent(UIControlEvents.touchUpInside).subscribe(onNext: { (success) in
//                
//            }, onError: { (error) in
//                
//            }, onCompleted: { 
//                
//            }, onDisposed: { 
//                
//            })
            
            button.setImage(UIImage.init(named: "common-back"), for: UIControlState.normal)
            let bar = UIBarButtonItem.init(customView: button)
            viewController.navigationItem.leftBarButtonItem = bar;
        }
    }


}
