//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Paul on 10.05.2023.
//

import UIKit

final class TimerView: WABaseInfoView {
    
    private let progressView: ProgressView = {
        let view = ProgressView()
        
        return view
    }()
}

extension TimerView {
    
    override func setupViews() {
        super.setupViews()
        
        addView(progressView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor, constant: -40)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        progressView.backgroundColor = .red
    }
}
