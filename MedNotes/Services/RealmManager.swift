//
//  RealmManager.swift
//  MedNotes
//
//  Created by Toktosunov on 25/1/23.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    private init() {}
    
    let realm = try! Realm()
    
    func saveReminderModel(model: ReminderModel) {
        try! realm.write {
            realm.add(model)
            print("testsave ", realm.configuration.fileURL!)
        }
    }
}
