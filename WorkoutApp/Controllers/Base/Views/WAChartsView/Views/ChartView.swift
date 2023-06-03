//
//  ChartView.swift
//  WorkoutApp
//
//  Created by Paul on 03.06.2023.
//

import UIKit

final class ChartView: WABaseView {
    
    private let yAxisSeparator: UIView = {
        
        let view = UIView()
        view.backgroundColor = Resources.Colors.separator
        return view
    }()
        
    private let xAxisSeparator: UIView = {
        
        let view = UIView()
        view.backgroundColor = Resources.Colors.separator
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]) {

        layoutIfNeeded()
        addDashLines()
    }
}

extension ChartView {
    
    override func setupViews() {
        super.setupViews()
        
        addView(yAxisSeparator)
        addView(xAxisSeparator)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            yAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisSeparator.topAnchor.constraint(equalTo: topAnchor),
            yAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            yAxisSeparator.widthAnchor.constraint(equalToConstant: 1),
            
            xAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            xAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        backgroundColor = .clear
    }
}

private extension ChartView {
    
    func addDashLines(with counts: Int? = nil) {
        
        (0..<9).map { CGFloat($0) }.forEach {
            
            addDashLine(at: bounds.height / 9 * $0)
        }
    }
    
    func addDashLine(at yPosition: CGFloat) {
        
        let startPoint = CGPoint(x: 0, y: yPosition)
        let endPoint = CGPoint(x: bounds.width, y: yPosition)
        
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])
        
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = Resources.Colors.separator.cgColor
        dashLayer.lineWidth = 1
        dashLayer.lineDashPattern = [6, 3]
        
        layer.addSublayer(dashLayer)
    }
}

