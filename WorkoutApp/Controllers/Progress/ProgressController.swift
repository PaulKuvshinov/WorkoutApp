//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Paul on 28.04.2023.
//

import UIKit

class ProgressController: WABaseController {
    
    private let dailyPerformanceView = DailyPerformanceView(with: Resources.Strings.Progress.dailyPerformance,
                                                            buttonTitle: Resources.Strings.Progress.last7Days)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
    
extension ProgressController {
    
    override func setupViews() {
        super.setupViews()
        
        view.addView(dailyPerformanceView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        view.backgroundColor = Resources.Colors.background
        
        title = Resources.Strings.NavBar.progress
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .progress)
        
        // размещаем кнопки на Вью
        addNavBarButton(at: .left, with: Resources.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.Progress.navBarRight)
        
        dailyPerformanceView.configure(with: [.init(value: "1", height: 0.2, title: "MON"),
                                              .init(value: "2", height: 0.4, title: "TUE"),
                                              .init(value: "3", height: 0.6, title: "WED"),
                                              .init(value: "4", height: 0.8, title: "THU"),
                                              .init(value: "5", height: 1, title: "FRI"),
                                              .init(value: "3", height: 0.6, title: "SAT"),
                                              .init(value: "2", height: 0.4, title: "SUN")])
    }
}
