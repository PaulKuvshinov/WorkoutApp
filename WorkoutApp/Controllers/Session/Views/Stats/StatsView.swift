//
//  StatsView.swift
//  WorkoutApp
//
//  Created by Paul on 26.05.2023.
//

import UIKit

final class StatsView: WABaseInfoView {
    
    private let stackView: UIStackView = {
        
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
        return view
    }()

    func configure(with items: [StatsItem]) {
        
        items.forEach {
            let itemView = StatsItemView()
            itemView.configure(with: $0)
            stackView.addArrangedSubview(itemView)
        }
    }
}

extension StatsView {
    
    override func setupViews() {
        super.setupViews()
        
        addView(stackView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
    }
}
