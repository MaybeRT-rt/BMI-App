//
//  ButtonExtension.swift
//  BMI App
//
//  Created by Liz-Mary on 09.11.2023.
//

import UIKit

extension UIButton {
    convenience init(isBackgroungWhite: Bool) {
        self.init(type: .system)
        
        let color = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 1.0)
        let textButton = isBackgroungWhite ? "Recalculate" : "Calculate"
        
        self.tintColor = isBackgroungWhite ? color : .white
        self.backgroundColor = isBackgroungWhite ? .white : color
        self.layer.cornerRadius = 10
        self.titleLabel?.font = .systemFont(ofSize: 20)
        self.setTitle(textButton, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
