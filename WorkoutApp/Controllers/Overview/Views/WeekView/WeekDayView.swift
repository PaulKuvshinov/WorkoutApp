//
//  WeekDayView.swift
//  WorkoutApp
//
//  Created by Paul on 04.05.2023.
//

import UIKit

extension WeekView {
    final class WeekdayView: WABaseView {
        
        private var nameLabel = UILabel()
        private var dateLabel = UILabel()
        private var stackView = UIStackView()
        
        func configure(with index: Int, and name: String) {
            
            let startOfWeek = Date().startOfWeek
            let currentDay = startOfWeek.goForward(to: index)
            let day = Calendar.current.component(.day, from: currentDay)
            
            let isToday = currentDay.stripTime() == Date().stripTime()
            
            backgroundColor = isToday ? Resources.Colors.active : Resources.Colors.background
            
            nameLabel.text = name.uppercased()
            nameLabel.textColor = isToday ? .white : Resources.Colors.inactive
            dateLabel.text = "\(day)"
            dateLabel.textColor = isToday ? .white : Resources.Colors.inactive
        }
    }
}

extension WeekView.WeekdayView {
    
    override func setupViews() {
        super.setupViews()
        
        addView(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel )
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
     
        backgroundColor = .red
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        stackView.spacing = 3
        stackView.axis = .vertical
        
        nameLabel.font = Resources.Fonts.helveticaRegular(with: 9)
        nameLabel.textAlignment = .center
        
        dateLabel.font = Resources.Fonts.helveticaRegular(with: 15)
        dateLabel.textAlignment = .center
    }
}
