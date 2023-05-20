//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Paul on 28.04.2023.
//

import UIKit

class SessionController: BaseController {
    
    private let timerView = TimerView()
    
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
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
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
    }
}
