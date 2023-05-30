//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Paul on 28.04.2023.
//

import UIKit

class SessionController: WABaseController {
    
    private let timerView = TimerView()
    
    private let statsView = StatsView(with: Resources.Strings.Session.workoutStats)
    private let stepsView = StepsView(with: Resources.Strings.Session.stepsCounter)
    
    private let timerDuration = 360.0
    
    override func navBarLeftButtonHandler() {
        
        if timerView.state == .isStopped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRunning ? .isStopped : .isRunning
        setNavBarButtonTitle(
            timerView.state == .isRunning ? Resources.Strings.Session.navBarStart : Resources.Strings.Session.navBarPause,
            at: .left)
    }
    
    override func navBarRightButtonHandler() {
        
        timerView.stopTimer()
        timerView.state = .isStopped
        
        setNavBarButtonTitle(Resources.Strings.Session.navBarStart, at: .left)
    }
}

extension SessionController {
    
    override func setupViews() {
        super.setupViews()
        view.addView(timerView)
        view.addView(statsView)
        view.addView(stepsView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
            
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            stepsView.topAnchor.constraint(equalTo: statsView.topAnchor),
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        title = Resources.Strings.NavBar.session
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .session)
        
        // размещаем кнопки на Вью
        addNavBarButton(at: .left, with: Resources.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: Resources.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0)
        
        timerView.callBack = { [weak self] in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self?.navBarRightButtonHandler()
            }
        }
        
        statsView.configure(with: [.heartRate(value: "155"),
                                   .averagePace(value: "8'20''"),
                                   .totalSteps(value: "7.682"),
                                   .totalDistance(value: "8.25")])
        
        stepsView.configure(with: [.init(value: "8K", height: 1, title: "2/14"),
                                   .init(value: "7K", height: 0.8, title: "2/15"),
                                   .init(value: "5K", height: 0.6, title: "2/16"),
                                   .init(value: "6K", height: 0.7, title: "2/17")])
    }
}
