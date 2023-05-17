//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Paul on 10.05.2023.
//

import UIKit

enum TimerState {
    
    case isRunning
    case isPaused
    case isStopped
}

final class TimerView: WABaseInfoView {
    
    private let elapsedTimeLabel: UILabel = {
       
        let label = UILabel()
        label.text = Resources.Strings.Session.elapsedTime
        label.font = Resources.Fonts.helveticaRegular(with: 14)
        label.textColor = Resources.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let elapsedTimeValueLabel: UILabel = {
       
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 46)
        label.textColor = Resources.Colors.titleGrey
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeLabel: UILabel = {
       
        let label = UILabel()
        label.text = Resources.Strings.Session.remainingTime
        label.font = Resources.Fonts.helveticaRegular(with: 13)
        label.textColor = Resources.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeValueLabel: UILabel = {
       
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 13)
        label.textColor = Resources.Colors.titleGrey
        label.textAlignment = .center
        return label
    }()
    
    private let timerStackView: UIStackView = {
       
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    private let progressView = ProgressView()
    
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    
    public var state: TimerState = .isStopped
    
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
        
        timer.invalidate()
    }
    
    func stopTimer() {
        
        guard self.timerProgress > 0 else { return }
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                      repeats: true,
                      block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress -= 0.1
            
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
}

extension TimerView {
    
    override func setupViews() {
        super.setupViews()
        addView(progressView)
        addView(timerStackView)
        
        [elapsedTimeLabel,
         elapsedTimeValueLabel,
         remainingTimeLabel,
         remainingTimeValueLabel].forEach {
            timerStackView.addArrangedSubview($0)
        }
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            timerStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            timerStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        
    }
}
