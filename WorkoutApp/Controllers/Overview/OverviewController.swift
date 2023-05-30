//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Paul on 27.04.2023.
//

import UIKit

class OverviewController: WABaseController {

    private let navBar = OverviewNavBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension OverviewController {
    
    override func setupViews() {
        super.setupViews()
        
        view.addView(navBar)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        navigationController?.navigationBar.isHidden = true
    }
}

