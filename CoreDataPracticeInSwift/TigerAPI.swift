//
//  TigerAPI.swift
//  CoreDataPracticeInSwift
//
//  Created by yye on 6/24/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

import Foundation
import CoreData

@objc(TigerAPI)
class TigerAPI: NSManagedObject {

    @NSManaged var icon: String
    @NSManaged var name: String
    @NSManaged var url: String

}
