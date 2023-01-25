//
//  AddNoteViewController.swift
//  MedNotes
//
//  Created by Toktosunov on 19/1/23.
//

import UIKit

class AddReminderViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add MedNote"
        
        setTableView()
    }
    
    private func setTableView() {
        tableView.backgroundColor = .systemGray6
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.register(AddReminderTableViewCell.self, forCellReuseIdentifier: AddReminderTableViewCell.identifier)
        tableView.register(HeaderAddReminderTableViewCell.self, forHeaderFooterViewReuseIdentifier: HeaderAddReminderTableViewCell.identifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 2
        case 2: return 1
        case 3: return 1
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddReminderTableViewCell.identifier, for: indexPath) as! AddReminderTableViewCell
        cell.cellConfigure(indexPath: indexPath )
        cell.setListCell(indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderAddReminderTableViewCell.identifier) as! HeaderAddReminderTableViewCell
        header.setListHeader(section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! AddReminderTableViewCell
        
        switch indexPath {
        case [0,0]: alertDate(label: cell.noteCellLabel) { (numberWeekday, date) in
            print (numberWeekday, date)
        }
        case [0,1]: alertTime(label: cell.noteCellLabel) { (date) in
            print (date)
        }
        case [1,0]: alertNote(label: cell.noteCellLabel, name: "Введите данные", placeholder: "Введите название лекарства")
        case [1,1]: alertNote(label: cell.noteCellLabel, name: "Введите данные", placeholder: "Введите срок годности")
        case [2,0]: alertNote(label: cell.noteCellLabel, name: "Введите данные", placeholder: "Введите прочую информацию")
        default:
            print("error")
        }
    }
}