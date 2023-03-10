//
//  NotesViewController.swift
//  MedNotes
//
//  Created by Toktosunov on 15/1/23.
//

import UIKit
import FSCalendar

class ReminderViewController: UIViewController{
    
    private var calendarHeightConstraint : NSLayoutConstraint!
    
    private let calendar: FSCalendar! = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    private let tableView: UITableView = {
        let tableStyle = UITableView()
        tableStyle.translatesAutoresizingMaskIntoConstraints = false
        return tableStyle
    }()
    
    private let button: UIButton = {
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
        title = "Reminder"
        
        setCalendar()
        setTableView()
        setConstraintsCalendar()
        setConstraintsButton()
        setConstraintsTableView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        button.addTarget(self, action: #selector(showHideButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addButtonTapped() {
        let addRemindViewController = AddReminderViewController()        
        let navigationViewController = UINavigationController(rootViewController: addRemindViewController)
        present(navigationViewController, animated: true)
    }
    
    @objc private func showHideButtonTapped() {
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
            button.setTitle("Close calendar", for: .normal)
        } else {
            calendar.setScope(.week, animated: true)
            button.setTitle("Open calendar", for: .normal)
        }
    }
    
    private func setCalendar() {
        calendar.scope = .week
        calendar.delegate = self
        calendar.dataSource = self
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ReminderTableViewCell.self, forCellReuseIdentifier: ReminderTableViewCell.identifier)
    }
}


// MARK: SetupCalendarAndConstraints

extension ReminderViewController {
    
    func setConstraintsCalendar() {
        view.addSubview(calendar)
        calendarHeightConstraint = NSLayoutConstraint(item: calendar!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        calendar.addConstraint(calendarHeightConstraint)        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
    
    func setConstraintsButton() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 0),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    func setConstraintsTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
}

extension ReminderViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
    }
}

extension ReminderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReminderTableViewCell.identifier, for: indexPath) as! ReminderTableViewCell
        return cell
    }
}
