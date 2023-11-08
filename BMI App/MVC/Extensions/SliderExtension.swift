//
//  SliderExtension.swift
//  BMI App
//
//  Created by Liz-Mary on 08.11.2023.
//

import UIKit

extension UISlider {
    convenience init(maxValue: Float) {
        self.init()
        self.maximumValue = maxValue
        self.value = maxValue / 2
        self.thumbTintColor = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 0.5)
        self.minimumTrackTintColor = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 0.5)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
