//
//  StatsItemView.swift
//  WorkoutApp
//
//  Created by Paul on 26.05.2023.
//

import UIKit

final class StatsItemView: WABaseView {
    
    struct StatsItem {
        
        let imageName: UIImage?
        let value: String
        let title: String
    }
    
    private let imageView = UIImageView()
    
    private let valueLabel: UILabel = {
       
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 17)
        label.textColor = Resources.Colors.titleGrey
        return label
    }()
    
    private let titleLabel: UILabel = {
       
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 10)
        label.textColor = Resources.Colors.inactive
        return label
    }()
    
    private let stackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    func configure(with item: StatsItem) {
        
        imageView.image = item.imageName
        valueLabel.text = item.value
        titleLabel.text = item.title
    }
}

extension StatsItemView {
    
    override func setupViews() {
        super.setupViews()
        
        addView(imageView)
        addView(stackView)
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(titleLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 23),
            
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
    }
}
