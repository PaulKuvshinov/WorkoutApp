//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Paul on 03.05.2023.
//

import UIKit

public enum WAButtonType {
    case primary
    case secondary
}

final class WAButton: UIButton {
    
    private var type: WAButtonType = .primary
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.image = Resources.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        return iconView
    }()
    
    init(with type: WAButtonType) {
        super.init(frame: .zero)
        self.type = type
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        self.type = .primary
        addViews()
        layoutViews()
        configure()
    }
    
    func setTitle(_ text: String?) {
        label.text = text
    }
}

private extension WAButton {
    
    func addViews() {
        addView(label)
        addView(iconView)
    }
    
    func layoutViews() {
        
        var horizontalOffset: CGFloat {
            switch type {
            case .primary: return 0
            case .secondary: return 10
            }
        }
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 10),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalOffset * 2)
        ])
    }
    
    func configure() {
        
        switch type {
        case .primary:
            label.textColor = Resources.Colors.inactive
            iconView.tintColor = Resources.Colors.inactive
            label.font = Resources.Fonts.helveticaRegular(with: 13)
        case .secondary:
            label.textColor = Resources.Colors.active
            iconView.tintColor = Resources.Colors.active
            label.font = Resources.Fonts.helveticaRegular(with: 15)
            backgroundColor = Resources.Colors.secondary
            layer.cornerRadius = 14
        }
        
        makeSystem(self)
    }
}
