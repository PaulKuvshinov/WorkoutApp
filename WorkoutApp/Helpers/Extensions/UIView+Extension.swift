//
//  UIView+Extension.swift
//  WorkoutApp
//
//  Created by Paul on 28.04.2023.
//

import UIKit

extension UIView {
    
    // добваляем "полоски" по границам view
    func addBottomBorder(with color: UIColor, height: CGFloat) {
        
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        separator.frame = CGRect(x: 0, y: frame.height - height, width: frame.width, height: height)
        addSubview(separator)
    }
}
