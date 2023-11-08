//
//  StackViewEztension.swift
//  BMI App
//
//  Created by Liz-Mary on 08.11.2023.
//

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, subview: [UIView]) {
        self.init(arrangedSubviews: subview)
        self.axis = axis
        self.distribution = distribution
        self.spacing = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
