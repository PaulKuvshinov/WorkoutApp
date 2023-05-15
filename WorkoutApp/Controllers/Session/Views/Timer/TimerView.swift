//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Paul on 10.05.2023.
//

import UIKit

final class TimerView: WABaseInfoView {
    
    private let progressView = ProgressView()
    
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    
    func configure(with duration: Double, progress: Double) {
        
        timerDuration = duration
        
        let tempCurrentValue = progress > duration ? duration : progress
        
        let goalValueDivider = duration == 0 ? 1 : duration
        
        let percent = tempCurrentValue / goalValueDivider
        
        progressView.drawProgress(with: CGFloat(percent))
    }
    
    func startTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                      repeats: true,
                      block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01
            
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
            }
            
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
    
    func pauseTimer() {
        
        
    }
    
    func stopTimer() {
        
        
    }
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
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        
    }
}
