//
//  MainTableViewCell.swift
//  RecordLife
//
//  Created by 齐云 on 2017/1/17.
//  Copyright © 2017年 齐云猛. All rights reserved.
//

import UIKit

class MoneyTableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var doSomething: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configCell(type: String) {
        
        typeLabel.text = type
        
    }
    
    
    

}
