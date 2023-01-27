//
//  AddNoteTableViewCell.swift
//  MedNotes
//
//  Created by Toktosunov on 19/1/23.
//

import UIKit

class AddReminderTableViewCell: UITableViewCell {
    
    static let identifier = "AddNoteTableViewCell"
    let listDataForCell = [["Дата", "Время"], ["Лекарство", "Срок годности"], ["Прочая информация"],["Повтор"]]
    
    let backgroundViewCell: UIView = {
        let backgroundStyle = UIView()
        backgroundStyle.backgroundColor = .white
        backgroundStyle.layer.cornerRadius = 10
        backgroundStyle.translatesAutoresizingMaskIntoConstraints = false
        return backgroundStyle
    }()
    
    let noteCellLabel: UILabel = {
        let noteCellStyle = UILabel()
        noteCellStyle.text = "Цитрамон"
        noteCellStyle.textColor = .black
        noteCellStyle.font = UIFont(name: "Avenir Next Demi Normal", size: 16)
        noteCellStyle.textAlignment = .left
        noteCellStyle.adjustsFontSizeToFitWidth = true
        noteCellStyle.translatesAutoresizingMaskIntoConstraints = false
        return noteCellStyle
    }()
    
    let dateSwitch: UISwitch = {
        let dateSwitchStyle = UISwitch()
        dateSwitchStyle.isOn = true
        dateSwitchStyle.isHidden = true
        dateSwitchStyle.onTintColor = .systemGreen
        dateSwitchStyle.translatesAutoresizingMaskIntoConstraints = false
        return dateSwitchStyle
    }()
    
    weak var selectProtocol: RepeatProtocol?
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        setConstraintsLabel()
        setConstraintsDate()
        setConstraintsDateSwitch()
        
        dateSwitch.addTarget(self, action: #selector(switchChange(param:)), for: .valueChanged)
    }
    
    func setListCell(indexPath: IndexPath) {
        noteCellLabel.text = listDataForCell[indexPath.section][indexPath.row]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellConfigure(indexPath: IndexPath) {
        noteCellLabel.text = listDataForCell[indexPath.section][indexPath.row]
        
        if indexPath == [3,0] {
            dateSwitch.isHidden = false
        }
        
    }
    
    @objc func switchChange(param: UISwitch) {
        selectProtocol?.selectRepeat(select: param.isOn)
    }
}

extension AddReminderTableViewCell {    
    
    func setConstraintsLabel() {
        self.addSubview(backgroundViewCell)
        NSLayoutConstraint.activate([
            backgroundViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgroundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backgroundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            backgroundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1),
        ])
    }
    
    func setConstraintsDate() {
        self.addSubview(noteCellLabel)
        NSLayoutConstraint.activate([
            noteCellLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            noteCellLabel.leadingAnchor.constraint(equalTo: backgroundViewCell.leadingAnchor, constant: 15),
        ])
    }
    
    func setConstraintsDateSwitch() {
        self.contentView.addSubview(dateSwitch)
        NSLayoutConstraint.activate([
            dateSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dateSwitch.trailingAnchor.constraint(equalTo: backgroundViewCell.trailingAnchor, constant: -25),
        ])
    }
}


protocol RepeatProtocol: AnyObject {
     
    func selectRepeat (select: Bool)
}
