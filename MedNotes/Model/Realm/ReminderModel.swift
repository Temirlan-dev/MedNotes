//
//  ReminderModel.swift
//  MedNotes
//
//  Created by Toktosunov on 25/1/23.
//

import RealmSwift

class ReminderModel: Object {
    
   @Persisted var reminerDate = Date()
   @Persisted var reminerTime = Date()
   @Persisted var medicament: String = ""
   @Persisted var expirationDate: String = ""
   @Persisted var desc: String = ""
   @Persisted var reminderRepeat: Bool = true

}
