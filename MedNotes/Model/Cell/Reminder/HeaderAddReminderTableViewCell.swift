//
//  HeaderAddReminderTableViewCell.swift
//  MedNotes
//
//  Created by Toktosunov on 24/1/23.
//

import UIKit

class HeaderAddReminderTableViewCell: UITableViewHeaderFooterView {
    
    let listDataForHeader = ["Дата и время", "Лекарство", "Прочая информация", "", ""]
    static let identifier = "HeaderAddNoteTableViewCell"
    
    let headerLabel: UILabel = {
        let headerLabelStyle = UILabel()
        headerLabelStyle.textColor = .black
        headerLabelStyle.font = UIFont(name: "Avenir Next Demi Bold", size: 16)
        headerLabelStyle.textAlignment = .left
        headerLabelStyle.adjustsFontSizeToFitWidth = true
        headerLabelStyle.translatesAutoresizingMaskIntoConstraints = false
            return headerLabelStyle
    }()
     
    override init( reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setConstraintsLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setListHeader(section: Int) {
        headerLabel.text = listDataForHeader[section]
    }
}

extension HeaderAddReminderTableViewCell {
    
    func setConstraintsLabel() {
        contentView.addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
    }
}
