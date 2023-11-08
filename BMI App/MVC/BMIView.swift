//
//  BMIView.swift
//  BMI App
//
//  Created by Liz-Mary on 08.11.2023.
//

import UIKit

class BMIView: UIView {
    
    lazy var backgroundView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "calculate_background")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var mainStackView = UIStackView()
    
    lazy var heightWeightStackView = UIStackView()
    
    lazy var heightStackView = UIStackView()
    let heightLabel = UILabel(algument: .left)
    let heightNumberLabel = UILabel(algument: .right)
    let heightSlider = UISlider(maxValue: 3)
    
    lazy var weightStackView = UIStackView()
    let weightLabel = UILabel(algument: .left)
    let weightNumberLabel = UILabel(algument: .right)
    let weightSlider = UISlider(maxValue: 300)
    
    lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 40, weight: .bold)
        element.textColor = .darkGray
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        heightWeightStackView = UIStackView(axis: .horizontal, distribution: .fillProportionally, subview: [heightStackView, weightStackView])
        
        heightStackView = UIStackView(axis: .horizontal, distribution: .fillProportionally, subview: [heightLabel, heightNumberLabel])
        weightStackView = UIStackView(axis: .horizontal, distribution: .fillProportionally, subview: [weightLabel, weightNumberLabel])
        
        mainStackView = UIStackView(axis: .vertical, distribution: .fill, subview: [titleLabel, heightStackView, heightSlider, weightStackView, weightSlider])
        
        addSubview(backgroundView)
        addSubview(mainStackView)
        addSubview(heightWeightStackView)
        
        titleLabel.text = "CALCULATE YOUR BMI"
        heightLabel.text = "Height"
        heightNumberLabel.text = "1.5 m"
        weightLabel.text = "Wieght"
        weightNumberLabel.text = "100 kg"
    }
}
