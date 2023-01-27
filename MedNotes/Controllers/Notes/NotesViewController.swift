//
//  TasksViewController.swift
//  MedNotes
//
//  Created by Toktosunov on 15/1/23.
//

import UIKit

class NotesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "MedNotes"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    @objc private func addButtonTapped() {
        let addNoteViewController = AddNoteViewController()
        navigationController?.pushViewController(addNoteViewController, animated: true)
    }
}
