//
//  Settings.swift
//  WorkoutApp
//
//  Created by Paul on 28.04.2023.
//

import UIKit

class SettingsController: WABaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        title = Resources.Strings.NavBar.settings
    }
}

extension SettingsController {
    override func setupViews() {
        super.setupViews()

    }

    override func constraintViews() {
        super.constraintViews()

    }

    override func configureViews() {
        super.configureViews()

        title = Resources.Strings.NavBar.settings
    }
}
