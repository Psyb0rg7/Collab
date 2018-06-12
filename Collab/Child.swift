//
//  Child.swift
//  Collab
//
//  Created by Fredrik Fatemi on 4/2/18.
//  Copyright © 2018 FPAApps. All rights reserved.
//

import Foundation

class Child: NSObject {
    var babyDate = Date()
    var firstName = ""
    var lastName = ""
    
    
    init(firstName: String, lastName: String, babyDate: Date) {
        super.init()
        self.firstName = firstName
        self.lastName = lastName
        self.babyDate = babyDate
    }
    static func addChild(child: Child) {
        var childArray = loadChildData()
        var childEncoded = child.firstName.append(";").append(child.lastName).append(";")
        childArray.append(child)
        let childData = NSKeyedArchiver.archivedData(withRootObject: childArray)
        UserDefaults.standard.set(childData, forKey: "children")
    }
    
    static func loadChildData() -> [Child] {
        guard let childData = UserDefaults.standard.object(forKey: "children") as? NSData else {
            print("'entries' not found in UserDefaults")
            let tmp: [Child] = []
            let emptyData = NSKeyedArchiver.archivedData(withRootObject: tmp)
            UserDefaults.standard.set(emptyData, forKey: "children")
            return tmp
        }
        
        guard let childArray = NSKeyedUnarchiver.unarchiveObject(with: childData as Data) as? [Child] else {
            print("Could not unarchive from childData")
            let tmp: [Child] = []
            let emptyData = NSKeyedArchiver.archivedData(withRootObject: tmp)
            UserDefaults.standard.set(emptyData, forKey: "children")
            return tmp
        }
        
        return childArray
    }
}
