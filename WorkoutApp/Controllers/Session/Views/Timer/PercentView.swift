//
//  PercentView.swift
//  WorkoutApp
//
//  Created by Paul on 18.05.2023.
//

import UIKit

extension TimerView {
    
    final class PercentView: WABaseView {
        
        private let stackView: UIStackView = {
           
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 5
            return view
        }()
        
        private let percentLabel: UILabel = {
            
            let label = UILabel()
            label.font = Resources.Fonts.helveticaRegular(with: 23)
            label.textColor = Resources.Colors.titleGrey
            label.textAlignment = .center
            return label
        }()
        
        private let subtitleLabel: UILabel = {
            
            let label = UILabel()
            label.font = Resources.Fonts.helveticaRegular(with: 10)
            label.textColor = Resources.Colors.inactive
            label.textAlignment = .center
            return label
        }()
        
        override func setupViews() {
            super.setupViews()
         
            addView(stackView)
            stackView.addArrangedSubview(percentLabel)
            stackView.addArrangedSubview(subtitleLabel)
        }
        
        override func constraintViews() {
            super.constraintViews()
            
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
        
        override func configureViews() {
            super.configureViews()
            
        }
        
        func configure(with title: String, andValue value: Int) {
            
            subtitleLabel.text = title
            percentLabel.text = "\(value)%"
        }
    }
}
