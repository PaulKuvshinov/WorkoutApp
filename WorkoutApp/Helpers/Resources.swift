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
            static let overview = "Overview"
            static let session = "Session"
            static let progress = "Progress"
            static let settings = "Settings"
        }
        
        enum NavBar {
            static let session = "High Intensity Cardio"
            static let progress = "Workout Progress"
        }
        
        enum Session {
            static let navBarLeft = "Pause"
            static let navBarRight = "Finish"
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
            static let overview = UIImage(systemName: "house")
            static let session = UIImage(systemName: "chart.bar")
            static let progress = UIImage(systemName: "stopwatch")
            static let settings = UIImage(systemName: "gearshape")
        }
        enum Common {
            static let downArrow = UIImage(systemName: "arrowtriangle.down")
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}

