//
//  AlertNote.swift
//  MedNotes
//
//  Created by Toktosunov on 21/1/23.
//

import UIKit

extension UIViewController {
    
    func alertNote(label: UILabel, name: String, placeholder: String, completionHandler: @escaping(String) -> Void) {
        let alertNote = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            let textFieldAlert = alertNote.textFields?.first
            guard let text = textFieldAlert?.text else { return }
            
            if (text.isEmpty) {
                print("null")
            } else {
                label.text = text
                completionHandler(text)
            }
        }
        
        alertNote.addTextField{ (textFieldAlert) in
            textFieldAlert.placeholder = placeholder
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
        alertNote.addAction(ok)
        alertNote.addAction(cancel)
        
        present(alertNote, animated: true, completion: nil)
    }
}
