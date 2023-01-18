//
//  NotesViewController.swift
//  MedNotes
//
//  Created by Toktosunov on 15/1/23.
//

import UIKit
import FSCalendar

class NotesViewController: UIViewController{
    
    fileprivate weak var calendar: FSCalendar!
    var calendarHeightConstraint: NSLayoutConstraint!
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "MedNotes"
        setupButton()
        setupConstraintsForCalendar()
        setupConstraintsForButton()
        button.addTarget(self, action: #selector(showHideButtonTapped), for: .touchUpInside)
    }
    
    func setupButton() {
        button.setTitle("Open calendar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 16)
    }
    
    @objc func showHideButtonTapped() {
        print("click")
    }
}

// MARK: SetupCalendarAndConstraints

extension NotesViewController {
    
    func setupConstraintsForCalendar() {
        
        let calendar = FSCalendar()
        calendar.dataSource = self
        calendar.delegate = self
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.scope = .month
        self.calendar = calendar
        view.addSubview(calendar)
        
        calendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        calendar.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
        func setupConstraintsForButton() {
        view.addSubview(button)
//        button.frame = CGRect(x: 0, y: 0, width: 170, height: 30)
        button.topAnchor.constraint(equalTo: calendar.topAnchor, constant: 0).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}

extension NotesViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        view.layoutIfNeeded()
    }
}

