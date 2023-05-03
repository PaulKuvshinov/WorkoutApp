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
    
    func makeSystem(_ button: UIButton) {
        button.addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        
        button.addTarget(self, action: #selector(handleOut), for: [
            .touchDragOutside,
            .touchUpOutside,
            .touchUpInside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc func handleIn() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 0.55
        }
    }
    
    @objc func handleOut() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 1
        }
    }

    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
