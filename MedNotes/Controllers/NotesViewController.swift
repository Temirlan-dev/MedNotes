//
//  NotesViewController.swift
//  MedNotes
//
//  Created by Toktosunov on 15/1/23.
//

import UIKit
import FSCalendar

class NotesViewController: UIViewController{
    
    var calendarHeightConstraint : NSLayoutConstraint!
    
    private var calendar: FSCalendar! = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    private var button : UIButton = {
        let buttonStyle = UIButton()
        buttonStyle.setTitle("Open calendar", for: .normal)
        buttonStyle.setTitleColor(.black, for: .normal)
        buttonStyle.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 15)
        buttonStyle.translatesAutoresizingMaskIntoConstraints = false
        return buttonStyle
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "MedNotes"
        
        calendar.scope = .week
        calendar.delegate = self
        calendar.dataSource = self
        
        setConstraintsCalendar()
        setConstraintsButton()
        button.addTarget(self, action: #selector(showHideButtonTapped), for: .touchUpInside)
    }
    
    @objc func showHideButtonTapped() {
        
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
            button.setTitle("Close calendar", for: .normal)
        } else {
            calendar.setScope(.week, animated: true)
            button.setTitle("Open calendar", for: .normal)
        }
    }
}


// MARK: SetupCalendarAndConstraints

extension NotesViewController {
    
    func setConstraintsCalendar () {
        view.addSubview(calendar)
        calendarHeightConstraint = NSLayoutConstraint(item: calendar!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        calendar.addConstraint(calendarHeightConstraint )
        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
    
    func setConstraintsButton () {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 0),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}

extension NotesViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
    }
}

