//
//  LoginViewController.swift
//  RecordLife
//
//  Created by 齐云 on 2016/12/26.
//  Copyright © 2016年 齐云猛. All rights reserved.
//

import UIKit
//import RxSwift
//import RxCocoa
//import RxDataSources
//import YYKit
import SwifterSwift

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var username_textField: UITextField!
    @IBOutlet weak var password_textField: UITextField!
    
    
    @IBAction func touch_id(_ sender: Any) {
        TouchID.share.touch_id { [unowned self] in
            self.login_success()
        }
    }
    @IBAction func Login(_ sender: Any) {
        
        login(username: username_textField.text, password: password_textField.text) { [unowned self] in
            self.login_success()
        }

        view.snapshotImage()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Q_Log(message: "哈哈哈哈111222233突就打了款")

        
        let _ =  self.rx.deallocated.subscribe { (id) in
            Q_Log(message: "登录成功")
        }
       
        
        
    }

    
    
    func login_success() {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storybord.instantiateViewController(withIdentifier: "BaseNavigation")
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = viewController
        delegate.window?.makeKeyAndVisible()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
