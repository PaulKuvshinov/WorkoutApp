//
//  Resources.swift
//  WorkoutApp
//
//  Created by Paul on 27.04.2023.
//

import UIKit

// вспомогательные перечисления для доступа к свойствам
enum Resources {
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inactive = UIColor(hexString: "#929DA5")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let titleGrey = UIColor(hexString: "#545C77")
        static let background = UIColor(hexString: "#F8F9F9")
        static let secondary = UIColor(hexString: "#F0F3FF")
    }
    
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .overview: return "Overview"
                case .session: return "Session"
                case .progress: return "Progress"
                case .settings: return "Settings"
                }
            }
        }
        
        enum NavBar {
            static let session = "High Intensity Cardio"
            static let progress = "Workout Progress"
            static let overview = "Today"
        }
        
        enum Session {
            static let navBarStart = "Start   "
            static let navBarPause = "Pause"
            static let navBarFinish = "Finish"
            
            static let elapsedTime = "Elapsed Time"
            static let remainingTime = "Remaining Time"
            static let completed = "Completed"
            static let remaining = "Remaining"
            
            static let workoutStats = "Workout stats"
            static let averagePace = "Average pace"
            static let heartRate = "Heart rate"
            static let totalDistance = "Total distance"
            static let totalSteps = "Total space"
            
            static let stepsCounter = "Steps Counter"
        }
        
        enum Progress {
            static let navBarLeft = "Export"
            static let navBarRight = "Details"
        }
        
        enum Overview {
            static let allWorkoutsButton = "All Workouts"
        }
    }
    
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .overview: return UIImage(systemName: "house")
                case .session: return UIImage(systemName: "chart.bar")
                case .progress: return UIImage(systemName: "stopwatch")
                case .settings: return UIImage(systemName: "gearshape")
                }
            }
        }
        enum Common {
            static let downArrow = UIImage(systemName: "arrowtriangle.down")
            static let plus = UIImage(systemName: "plus.circle.fill")
        }
        
        enum Session {
            static let averagePaceIcon = UIImage(systemName: "speedometer")
            static let heartRateIcon = UIImage(systemName: "bolt.heart")
            static let totalDistanceIcon = UIImage(systemName: "map")
            static let totalStepsIcon = UIImage(systemName: "figure.step.training")
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}

