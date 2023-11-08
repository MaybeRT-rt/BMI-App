//
//  LabelExtension.swift
//  BMI App
//
//  Created by Liz-Mary on 08.11.2023.
//

import UIKit

extension UILabel {
    convenience init(algument: NSTextAlignment) {
        self.init()
        self.textAlignment = algument
        self.font = .systemFont(ofSize: 17, weight: .light)
        self.textColor = .darkGray
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
