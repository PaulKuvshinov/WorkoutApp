//
//  WAChartsView.swift
//  WorkoutApp
//
//  Created by Paul on 02.06.2023.
//

import UIKit

extension WAChartsView {
    
    struct Data {
        
        let value: Int
        let title: String
    }
}

final class WAChartsView: WABaseView {
    
    private let yAxisView = YAxisView()
    private let xAxisView = XAxisView()
    
    private let chartView = UIView()
    
    func configure(with data: [WAChartsView.Data]) {
        
        yAxisView.configure(with: data)
        xAxisView.configure(with: data)
    }
}

extension WAChartsView {
    
    override func setupViews() {
        super.setupViews()
        
        addView(yAxisView)
        addView(xAxisView)
        addView(chartView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisView.topAnchor.constraint(equalTo: topAnchor),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),
            
            xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 12),
            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 12),
            chartView.topAnchor.constraint(equalTo: topAnchor),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor),
            chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        backgroundColor = .clear
        chartView.backgroundColor = .cyan
    }
}

