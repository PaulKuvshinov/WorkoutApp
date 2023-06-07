//
//  TrainingCellView.swift
//  WorkoutApp
//
//  Created by Paul on 07.06.2023.
//

import UIKit

enum CellRoundedType {
    
    case top, bottom, all, notRounded
}

final class TrainingCellView: UICollectionViewCell {
    
    static let id = "TrainingCellView"
    
    private let title: UILabel = {
        
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 17)
        label.textColor = Resources.Colors.titleGrey
        return label
    }()
    
    private let subTitle: UILabel = {
        
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 13)
        label.textColor = Resources.Colors.inactive
        return label
    }()
    
    private let stackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        return stackView
    }()
    
    private let rightArrow: UIImageView = {
        
        let view = UIImageView()
        view.image = Resources.Images.Overview.rightArrow
        view.tintColor = Resources.Colors.inactive
        return view
    }()
    
    private let checkmarkNotDone: UIImageView = {
        
        let view = UIImageView()
        view.image = Resources.Images.Overview.checkmarkNotDone
        view.tintColor = Resources.Colors.inactive
        return view
    }()
    
    private let checkmarkDone: UIImageView = {
        
        let view = UIImageView()
        view.image = Resources.Images.Overview.checkmarkDone
        view.layer.backgroundColor = Resources.Colors.active.cgColor
        return view
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
    
    func configure(with title: String, subTitle: String, isDone: Bool, roundedType: CellRoundedType) {
        self.title.text = title
        self.subTitle.text = subTitle
        
        checkmarkNotDone.image = isDone ?
        Resources.Images.Overview.checkmarkDone :
        Resources.Images.Overview.checkmarkNotDone
        
        checkmarkNotDone.tintColor = isDone ?
        Resources.Colors.active : Resources.Colors.inactive
        
        switch roundedType {
            
        case .all: self.roundCorners([.allCorners], radius: 5)
        case .top: self.roundCorners([.topLeft, .topRight], radius: 5)
        case .bottom: self.roundCorners([.bottomLeft, .bottomRight], radius: 5)
        case .notRounded: self.roundCorners([.allCorners], radius: 0)
        }
    }
}

extension TrainingCellView {
    
    func setupViews() {
        
        addView(checkmarkNotDone)
        addView(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subTitle)
        addView(rightArrow)
    }
    
    func constraintViews() {
        
        NSLayoutConstraint.activate([
            checkmarkNotDone.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            checkmarkNotDone.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkNotDone.heightAnchor.constraint(equalToConstant: 28),
            checkmarkNotDone.widthAnchor.constraint(equalTo: checkmarkNotDone.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: checkmarkNotDone.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: rightArrow.leadingAnchor, constant: -15),
            
            rightArrow.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            rightArrow.heightAnchor.constraint(equalToConstant: 12),
            rightArrow.widthAnchor.constraint(equalToConstant: 7)
        ])
    }
    
    func configureViews() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = Resources.Colors.separator.cgColor
    }
}

