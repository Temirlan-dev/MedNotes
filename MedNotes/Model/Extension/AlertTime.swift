//
//  AlertTime.swift
//  MedNotes
//
//  Created by Toktosunov on 21/1/23.
//

import UIKit

extension UIViewController {
    
    func alertTime(label: UILabel, completionHandler: @escaping(Date) -> Void) {
        let alertTime = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        
        let timePicker =  UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.locale = NSLocale(localeIdentifier: "Ru_ru") as Locale
        
        alertTime.view.addSubview(timePicker)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm"
            let timeString = timeFormatter.string(from: timePicker.date)
            
            let timeNote = timePicker.date 
            completionHandler(timeNote)
            
            label.text = timeString
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default,handler: nil)
        
        alertTime.addAction(ok)
        alertTime.addAction(cancel)
        
        alertTime.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        timePicker.widthAnchor.constraint(equalTo: alertTime.view.widthAnchor).isActive = true
        timePicker.heightAnchor.constraint(equalToConstant: 160).isActive = true
        timePicker.topAnchor.constraint(equalTo: alertTime.view.topAnchor, constant: 20).isActive = true
        
        present(alertTime, animated: true, completion: nil)
    }
}
