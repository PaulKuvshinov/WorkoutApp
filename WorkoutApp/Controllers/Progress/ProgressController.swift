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
    
    private let monthlyPerformanceView = MonthlyPerformanceView(with: Resources.Strings.Progress.monthlyPerformance,
                                                            buttonTitle: Resources.Strings.Progress.last10Months)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
    
extension ProgressController {
    
    override func setupViews() {
        super.setupViews()
        
        view.addView(dailyPerformanceView)
        view.addView(monthlyPerformanceView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68),
            
            monthlyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            monthlyPerformanceView.topAnchor.constraint(equalTo: dailyPerformanceView.bottomAnchor, constant: 15),
            monthlyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            monthlyPerformanceView.heightAnchor.constraint(equalTo: monthlyPerformanceView.widthAnchor, multiplier: 1.06)
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
        
        monthlyPerformanceView.configure(with: [.init(value: 45, title: "Mar"),
                                                .init(value: 55, title: "Apr"),
                                                .init(value: 60, title: "May"),
                                                .init(value: 65, title: "Jun"),
                                                .init(value: 70, title: "Jul"),
                                                .init(value: 80, title: "Aug"),
                                                .init(value: 65, title: "Sep"),
                                                .init(value: 45, title: "Oct"),
                                                .init(value: 30, title: "Nov"),
                                                .init(value: 15, title: "Dec")],
                                         topChartOffset: 10)
    }
}
