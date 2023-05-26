//
//  StatsView.swift
//  WorkoutApp
//
//  Created by Paul on 26.05.2023.
//

import UIKit

final class StatsView: WABaseInfoView {
    
    private let itemView = StatsItemView()
    
    override func setupViews() {
        super.setupViews()
     
        addView(itemView)
        
        itemView.configure(with: StatsItemView.StatsItem(imageName: Resources.Images.Session.heartRateIcon,
                                                         value: "155 bpm",
                                                         title: Resources.Strings.Session.heartRate.uppercased()))
        
        NSLayoutConstraint.activate([
            
            itemView.topAnchor.constraint(equalTo: topAnchor, constant: 45),
            itemView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        ])
    }
}
