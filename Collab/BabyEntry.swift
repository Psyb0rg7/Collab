//
//  BabyEntry.swift
//  Collab
//
//  Created by Fredrik Fatemi on 4/2/18.
//  Copyright © 2018 FPAApps. All rights reserved.
//

import Foundation

class BabyEntry {
    static func saveEntry(entry: BabyEntry) {
        var childArray = loadEntryData()
        childArray.append(entry)
        let childData = NSKeyedArchiver.archivedData(withRootObject: childArray)
        UserDefaults.standard.set(childData, forKey: "entries")
    }
    
    static func loadEntryData() -> [BabyEntry] {
        guard let childData = UserDefaults.standard.object(forKey: "entries") as? NSData else {
            print("'entries' not found in UserDefaults")
            let tmp: [BabyEntry] = []
            return tmp
        }
        
        guard let childArray = NSKeyedUnarchiver.unarchiveObject(with: childData as Data) as? [BabyEntry] else {
            print("Could not unarchive from childData")
            let tmp: [BabyEntry] = []
            return tmp
        }
        
        return childArray
    }
}
