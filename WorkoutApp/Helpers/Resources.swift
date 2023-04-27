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
        static var active = UIColor(hexString: "#437BFE")
        static var inactive = UIColor(hexString: "#929DA5")
        static var separator = UIColor(hexString: "#E8ECEF")
    }
    
    
    enum Strings {
        enum TabBar {
            static var overview = "Overview"
            static var session = "Session"
            static var progress = "Progress"
            static var settings = "Settings"
        }
    }
    
    enum Images {
        enum TabBar {
            static var overview = UIImage(systemName: "house")
            static var session = UIImage(systemName: "chart.bar")
            static var progress = UIImage(systemName: "stopwatch")
            static var settings = UIImage(systemName: "gearshape")
        }
    }
}

