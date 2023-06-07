//
//  SectionHeaderView.swift
//  WorkoutApp
//
//  Created by Paul on 06.06.2023.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {
    
    static let id = "SectionHeaderView"
    
    private let title: UILabel = {
        
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 13)
        label.textColor = Resources.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        constraintViews()
        configureViews()
    }
    
    func configure(with date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd"
        
        self.title.text = dateFormatter.string(from: date).uppercased()
    }
}

extension SectionHeaderView {
    
    func setupViews() {
        addView(title)
    }
    
    func constraintViews() {
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configureViews() {
        
    }
}
