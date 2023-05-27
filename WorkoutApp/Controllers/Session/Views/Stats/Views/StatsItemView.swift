//
//  StatsItemView.swift
//  WorkoutApp
//
//  Created by Paul on 26.05.2023.
//

import UIKit

enum StatsItem {
    
    case heartRate(value: String)
    case averagePace(value: String)
    case totalDistance(value: String)
    case totalSteps(value: String)
    
    var data: StatsItemView.StatsItemData {
        
        switch self {
        case .heartRate(let value):
            return .init(imageName: Resources.Images.Session.heartRateIcon,
                         value: value + " /bpm",
                         title: Resources.Strings.Session.heartRate)
        case .averagePace(let value):
            return .init(imageName: Resources.Images.Session.averagePaceIcon,
                         value: value + " /km",
                         title: Resources.Strings.Session.averagePace)
        case .totalDistance(let value):
            return .init(imageName: Resources.Images.Session.totalDistanceIcon,
                         value: value + " /km",
                         title: Resources.Strings.Session.totalDistance)
        case .totalSteps(let value):
            return .init(imageName: Resources.Images.Session.totalStepsIcon,
                         value: value,
                         title: Resources.Strings.Session.totalSteps)
        }
    }
}

final class StatsItemView: WABaseView {
    
    struct StatsItemData {
        
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
        
        imageView.image = item.data.imageName
        valueLabel.text = item.data.value
        titleLabel.text = item.data.title
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
