//
//  AlertDate.swift
//  MedNotes
//
//  Created by Toktosunov on 21/1/23.
//

import UIKit

extension UIViewController {
    
    func alertDate(label: UILabel, completionHandler: @escaping(Int, NSDate) -> Void) {
        let alertDate = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        
        let datePicker =  UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        alertDate.view.addSubview(datePicker)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            let dateString = dateFormatter.string(from: datePicker.date)
            
            let calendar = Calendar.current
            let component = calendar.dateComponents([.weekday], from: datePicker.date)
            guard let weekday = component.weekday else {return}
            let numberWeekday = weekday
            let date = datePicker.date as NSDate
            completionHandler(numberWeekday, date)            
            label.text = dateString
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default,handler: nil)
        
        alertDate.addAction(ok)
        alertDate.addAction(cancel)
        
        alertDate.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.widthAnchor.constraint(equalTo: alertDate.view.widthAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 160).isActive = true
        datePicker.topAnchor.constraint(equalTo: alertDate.view.topAnchor, constant: 20).isActive = true
        
        present(alertDate, animated: true, completion: nil)
    }
}
