//
//  WABarView.swift
//  WorkoutApp
//
//  Created by Paul on 30.05.2023.
//

import UIKit

extension WABarView {
    
    struct Data {
        
        let value: String
        let height: Double
        let title: String
    }
}

final class WABarView: WABaseView {
    
    private let height: Double
    
    private let valueLabel: UILabel = {
       
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 13)
        label.textColor = Resources.Colors.active
        return label
    }()
    
    private let barView: UIView = {
        
        let view = UIView()
        view.backgroundColor = Resources.Colors.active
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    private let titleLabel: UILabel = {
       
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 9)
        label.textColor = Resources.Colors.inactive
        return label
    }()
    
    init(data: Data) {
        
        self.height = data.height
        
        super.init(frame: .zero)
        
        titleLabel.text = data.title
        valueLabel.text = data.value
    }
    
    required init?(coder: NSCoder) {
        self.height = 0
        
        super.init(frame: .zero)
    }
    

}

extension WABarView {
    
    override func setupViews() {
        super.setupViews()
        
        addView(valueLabel)
        addView(barView)
        addView(titleLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 5),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: height, constant: -40),
            
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)

        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        backgroundColor = .clear
    }
}
