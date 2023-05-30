//
//  StepsView.swift
//  WorkoutApp
//
//  Created by Paul on 30.05.2023.
//

import UIKit

final class StepsView: WABaseInfoView {
    
    private let barsView = WABarsView()

    func configure(with items: [WABarView.Data]) {
        barsView.configure(with: items)
    }
}

extension StepsView {
    
    override func setupViews() {
        super.setupViews()
        
        addView(barsView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
    }
}
