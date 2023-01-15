//
//  ViewController.swift
//  MedNotes
//
//  Created by Toktosunov on 15/1/23.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    // MARK: - Function calls all ViewControllers
    
    func setupTabBar() {
        let notesViewController = setupNavigationController(viewController: NotesViewController(), itemImage: "calendar.badge.clock", itemtitle: "Notes")
        let tasksViewController = setupNavigationController(viewController: TasksViewController(), itemImage: "text.badge.checkmark", itemtitle: "Tasks")
        viewControllers = [notesViewController, tasksViewController]
    }
    
    // MARK: - The function sets the type of elements in the TabBar
    
    func setupNavigationController(viewController: UIViewController, itemImage: String, itemtitle: String) -> UINavigationController {
        let item = UITabBarItem(title: itemtitle, image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 10 , left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = item
        return navController
    }
} 

