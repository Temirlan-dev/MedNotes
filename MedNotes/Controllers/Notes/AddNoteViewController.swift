//
//  AddNoteViewController.swift
//  MedNotes
//
//  Created by Toktosunov on 19/1/23.
//

import UIKit

class AddNoteViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add MedNote"
        
        tableView.backgroundColor = .systemGray6
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(AddNoteTableViewCell.self, forCellReuseIdentifier: AddNoteTableViewCell.identifier)
        tableView.register(HeaderAddNoteTableViewCell.self, forHeaderFooterViewReuseIdentifier: HeaderAddNoteTableViewCell.identifier)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: AddNoteTableViewCell.identifier, for: indexPath) as! AddNoteTableViewCell
        cell.cellConfigure(indexPath: indexPath )
        cell.setListCell(indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderAddNoteTableViewCell.identifier) as! HeaderAddNoteTableViewCell
        header.setListHeader(section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    

}
