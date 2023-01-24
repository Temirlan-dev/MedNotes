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
        
        setTabBar()
    }
    
    // MARK: - Function calls all ViewControllers
    
    private func setTabBar() {
        let notesViewController = setNavigationController(viewController: ReminderViewController(), itemImage: "calendar.badge.clock", itemtitle: "Reminder")
        let tasksViewController = setNavigationController(viewController: NotesViewController(), itemImage: "text.badge.checkmark", itemtitle: "MedNotes")
        viewControllers = [notesViewController, tasksViewController]
        tabBar.backgroundColor = .systemGray6
        tabBar.unselectedItemTintColor = .black
    }
    
    // MARK: - The function sets the type of elements in the TabBar
    
    private func setNavigationController(viewController: UIViewController, itemImage: String, itemtitle: String) -> UINavigationController {
        let item = UITabBarItem(title: itemtitle, image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 10 , left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = item
        return navController
    }
} 

