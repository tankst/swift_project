//
//  BaseViewController.swift
//  RecordLife
//
//  Created by 齐云 on 2016/12/26.
//  Copyright © 2016年 齐云猛. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources



class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
//        self.automaticallyAdjustsScrollViewInsets = false;
//        self.edgesForExtendedLayout = .all;
        
        Q_Log(message: "生命周期--创建" + (NSString.self() as String));
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        Q_Log(message: "生命周期--内存报警" + (NSString.self() as String))
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Q_Log(message: "生命周期--显示" + (NSString.self() as String))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        Q_Log(message: "生命周期--消失" + (NSString.self() as String))
    }
    
    deinit {
        Q_Log(message: "生命周期--销毁" + (NSString.self() as String))
    }
    
    
    func setStateBar(style: UIStatusBarStyle) {
        UIApplication.shared.setStatusBarStyle(style, animated: true)
    }
    
    func setNavigationBar(hidden: Bool)  {
        navigationController?.setNavigationBarHidden(hidden, animated: true)
    }
    
    func setStateBarAndNavigateBar(style: UIStatusBarStyle, hidden: Bool)  {
        UIApplication.shared.setStatusBarStyle(style, animated: true)
        navigationController?.setNavigationBarHidden(hidden, animated: true)
    }
    
    func pushViewController(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func popViewController() {
        let _ = navigationController?.popViewController(animated: true)
    }


}
