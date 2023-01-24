//
//  ReminderTableViewCell.swift
//  MedNotes
//
//  Created by Toktosunov on 24/1/23.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {
    
    static let identifier = "NoteCustomTableViewCell"
    
    let medicamentlabel: UILabel = {
        let medicamentStyle = UILabel()
            medicamentStyle.text = "Цитрамон"
            medicamentStyle.textColor = .black
            medicamentStyle.font = UIFont(name: "Avenir Next Demi Bold", size: 16)
            medicamentStyle.textAlignment = .left
            medicamentStyle.adjustsFontSizeToFitWidth = true
            medicamentStyle.translatesAutoresizingMaskIntoConstraints = false
            return medicamentStyle
    }()
    
    let date: UILabel = {
        let dateStyle = UILabel()
            dateStyle.text = "Дата и время"
            dateStyle.textColor = .black
            dateStyle.font = UIFont(name: "Avenir Next Demi Normal", size: 18)
            dateStyle.textAlignment = .left
            dateStyle.adjustsFontSizeToFitWidth = true
            dateStyle.translatesAutoresizingMaskIntoConstraints = false
            return dateStyle
    }()
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraintsLabel()
        setConstraintsDate()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReminderTableViewCell {
    
    func setConstraintsLabel() {
        contentView.addSubview(medicamentlabel)
        NSLayoutConstraint.activate([
            medicamentlabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            medicamentlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            medicamentlabel.heightAnchor.constraint(equalToConstant: 40),
            medicamentlabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setConstraintsDate() {
        contentView.addSubview(date)
        NSLayoutConstraint.activate([
            date.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            date.leadingAnchor.constraint(equalTo: medicamentlabel.trailingAnchor, constant: 50),
            date.heightAnchor.constraint(equalToConstant: 40),
            date.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}

