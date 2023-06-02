//
//  XAxisView.swift
//  WorkoutApp
//
//  Created by Paul on 02.06.2023.
//

import UIKit

final class XAxisView: WABaseView {
    
    private let stackView: UIStackView = {
        
        let view = UIStackView()
        view.distribution = .equalSpacing
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]) {
        
        stackView.arrangedSubviews.forEach {
            
            $0.removeFromSuperview()
        }
        
        data.forEach {
            
            let label = UILabel()
            label.font = Resources.Fonts.helveticaRegular(with: 9)
            label.textColor = Resources.Colors.inactive
            label.text = $0.title.uppercased()
            label.textAlignment = .center
            stackView.addArrangedSubview(label)
        }
    }
}

extension XAxisView {
    
    override func setupViews() {
        super.setupViews()
        
        addView(stackView)
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
        
        backgroundColor = .clear
    }
}
