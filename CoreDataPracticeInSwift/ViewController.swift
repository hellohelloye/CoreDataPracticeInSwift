//
//  ViewController.swift
//  CoreDataPracticeInSwift
//
//  Created by yye on 6/24/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    var tigerArray = NSMutableArray()
    var selectedIndex = NSIndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tigerArray = self.receiveTigerData()!
       // self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tigerArray.count
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as? CustomTableViewCell
        
        if cell == nil {
            cell = CustomTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        }
        
        cell?.cellLabel?.text = self.tigerArray[indexPath.row].valueForKey("name") as? String
        return cell!
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        self.selectedIndex = NSIndexPath(forRow: indexPath.row, inSection: 0)
//       // self.performSegueWithIdentifier("showDetailCellInfo", sender: self)
//        var detailViewController = self.navigationController. as? DetailViewController
//        
//        detailViewController?.tiger = self.tigerArray[self.selectedIndex.row] as! TigerAPI
//    }
//    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var cell:CustomTableViewCell! = sender as? CustomTableViewCell
        self.selectedIndex = self.tableView.indexPathForCell(cell) as NSIndexPath!
        var detailViewController = segue.destinationViewController as? DetailViewController
       
        detailViewController?.tigerName = (self.tigerArray[self.selectedIndex.row].valueForKey("name") as? String)!
        detailViewController?.icon = (self.tigerArray[self.selectedIndex.row].valueForKey("icon") as? String)!
        detailViewController?.url = (self.tigerArray[self.selectedIndex.row].valueForKey("url") as? String)!
    }
    
    func receiveTigerData()-> NSMutableArray? {
        var TigerArray = NSMutableArray()
        let context =  (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        var request = NSFetchRequest()
        var entity = NSEntityDescription.entityForName("TigerAPI", inManagedObjectContext: context!)
        request.entity = entity
        
        var error: NSError? = nil
        let results = context?.executeFetchRequest(request, error: &error)
        
        if !context!.save(&error) {
            println("Error fetching on the managed object context")
        }
        
        if results!.count > 0 {
            for result: AnyObject in results! as! [TigerAPI] {
                TigerArray.addObject(result)
            }
        }
        return TigerArray
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

