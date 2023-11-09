//
//  CalcBrain.swift
//  BMI App
//
//  Created by Liz-Mary on 09.11.2023.
//

import UIKit

struct CalcBrain {
    private var bmi: BMIModel?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        switch bmiValue {
        case 0...18.5: bmi = BMIModel(value: bmiValue, advice: "Eat more pies", color: .systemBlue)
        case 18.5...25.9: bmi = BMIModel(value: bmiValue, advice: "Fit as a fiddle", color: .systemGreen)
        default: bmi = BMIModel(value: bmiValue, advice: "Eat less pies", color: .red)
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
}
