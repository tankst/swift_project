//
//  MainViewController.swift
//  RecordLife
//
//  Created by 齐云 on 2017/1/17.
//  Copyright © 2017年 齐云猛. All rights reserved.
//

import UIKit

class MoneyViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var locationManager = LocationManager()
    
    
    
    var cellID = "miancellID"
    

    var dataArr = ["时间",
                   "地点",
                   "资产走向",
                   "金额",
                   "支付方式",
                   "资金用途",
                   "备注"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        
        
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
//        self.rx.observe(locationManager, "cityName").subscribe { [unowned self] (manager) in
//            
//            Q_Log(message: self)
//            
//            Q_Log(message: manager)
//            
//            
//            }.dispose()
        

        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! MoneyTableViewCell
        cell.configCell(type: dataArr[indexPath.row])
       return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        
//        LocationManager.share.start()

        
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
