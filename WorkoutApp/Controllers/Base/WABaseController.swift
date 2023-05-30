//
//  BaseController.swift
//  WorkoutApp
//
//  Created by Paul on 28.04.2023.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class WABaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        constraintViews()
        configureViews()
    }
}

@objc extension WABaseController {
    
    func setupViews() {}
    
    func constraintViews() {}
    
    func configureViews() {
        view.backgroundColor = Resources.Colors.background
    }
    
    func navBarLeftButtonHandler() {
        print("Nav Bar left button tapped")
    }
    
    func navBarRightButtonHandler() {
        print("Nav Bar right button tapped")
    }
}

extension WABaseController {
    
    // создаем и настраиваем кастомные НавБар кнопки
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resources.Colors.active, for: .normal)
        button.setTitleColor(Resources.Colors.inactive, for: .disabled)
        button.titleLabel?.font = Resources.Fonts.helveticaRegular(with: 17)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    func setNavBarButtonTitle(_ title: String, at position: NavBarPosition) {
        
        switch position {
            
        case .left:
            (navigationItem.leftBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        case .right:
            (navigationItem.rightBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        }
    }
}
