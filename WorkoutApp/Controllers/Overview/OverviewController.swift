//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Paul on 27.04.2023.
//

import UIKit

class OverviewController: WABaseController {

    private let navBar = OverviewNavBar()
    
    private let header = SectionHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension OverviewController {
    
    override func setupViews() {
        super.setupViews()
        
        view.addView(navBar)
        view.addView(header)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            header.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -16),
            header.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        navigationController?.navigationBar.isHidden = true
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd"
        
        header.configure(with: dateFormatter.string(from: Date()))
    }
}

