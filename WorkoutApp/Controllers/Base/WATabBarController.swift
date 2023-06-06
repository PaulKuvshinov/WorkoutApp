//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Paul on 27.04.2023.
//

import UIKit

// перечисление по вкладкам ТабБара
enum Tabs: Int, CaseIterable {
    case overview
    case session
    case progress
    case settings
}

final class WATabBarController: UITabBarController {
    
    // запускаем через nib (также можно через viewDidLoad
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    // настройка ТабБара
    private func configureViews() {
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        // создаем контроллеры и нав контроллеры для дальнейших переходов
        let controllers: [WANavBarController] = Tabs.allCases.map { tab in
            let controller = WANavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.title(for: tab),
                                                 image: Resources.Images.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }
        
        // помещаем созданные контроллеры в сэт
        setViewControllers(controllers,
                           animated: false)
    }
    
    private func getController(for tab: Tabs) -> WABaseController {
        switch tab {
        case .overview: return OverviewController()
        case .progress: return ProgressController()
        case .session: return SessionController()
        case .settings: return SessionController()
        }
    }
    
}
