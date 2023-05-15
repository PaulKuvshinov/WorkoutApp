//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Paul on 28.04.2023.
//

import UIKit

class SessionController: BaseController {
    
    private let timerView = TimerView()
    
    private let timerDuration = 3.0
    
    override func navBarLeftButtonHandler() {
        
        timerView.startTimer()
    }
    
    override func navBarRightButtonHandler() {
        
        timerView.stopTimer()
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
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        title = Resources.Strings.NavBar.session
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .session)
        
        // размещаем кнопки на Вью
        addNavBarButton(at: .left, with: Resources.Strings.Session.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.Session.navBarRight)
        
        timerView.configure(with: timerDuration, progress: 0)
    }
}
