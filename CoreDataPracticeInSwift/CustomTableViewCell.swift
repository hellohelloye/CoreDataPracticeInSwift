//
//  CustomTableViewCell.swift
//  CoreDataPracticeInSwift
//
//  Created by yye on 6/29/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.cellLabel?.text = "hello"
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}