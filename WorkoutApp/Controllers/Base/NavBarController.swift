//
//  NavBarController.swift
//  WorkoutApp
//
//  Created by Paul on 28.04.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // настройка НавБара
    private func configure() {
        view.backgroundColor = .white
        // чтобы НавБар не заканчивался по границе статус-бара
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resources.Colors.titleGrey,
            .font: Resources.Fonts.helveticaRegular(with: 17)]
        
        navigationBar.addBottomBorder(with: Resources.Colors.separator, height: 1)
    }
}
