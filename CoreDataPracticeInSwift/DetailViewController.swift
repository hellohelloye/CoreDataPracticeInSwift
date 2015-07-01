//
//  DetailViewController.swift
//  CoreDataPracticeInSwift
//
//  Created by yye on 6/30/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var iconView: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var urlWebView: UIWebView!
    
    @IBAction func backBtn(sender: UIButton) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    var icon = String()
    var tigerName = String()
    var url = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println("testing \(icon)")
        println("web url \(url)")
        println("tigerName \(tigerName)")
        self.setUpView()
    }
    
    func setUpView() {
        if NSData(contentsOfURL: NSURL(string: self.icon)!) == nil {
            iconView.image = UIImage(named: "AngelPurpleRose.png")
        } else {
            iconView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: self.icon)!)!)!
        }
        
        self.name.text = self.tigerName
        self.urlWebView.loadRequest(NSURLRequest(URL: NSURL(string: self.url)!))
    }
}
