//
//  BMIView.swift
//  BMI App
//
//  Created by Liz-Mary on 08.11.2023.
//

import UIKit

protocol BMIDelegate: AnyObject {
    func calcTapped(_ sender: UIButton)
}

class BMIView: UIView {
    
    weak var delegate: BMIDelegate?
    
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
    
    lazy var calcButton: UIButton = {
        let element = UIButton()
        element.tintColor = .white
        element.backgroundColor = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 1.0)
        element.layer.cornerRadius = 10
        element.titleLabel?.font = .systemFont(ofSize: 20)
        element.addTarget(self, action: #selector(calcTapped), for: .touchUpInside)
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
        
        heightWeightStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, subview: [heightStackView, weightStackView])
        
        heightStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, subview: [heightLabel, heightNumberLabel])
        weightStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, subview: [weightLabel, weightNumberLabel])
        
        mainStackView = UIStackView(axis: .vertical, distribution: .fillProportionally, subview: [titleLabel, heightStackView, heightSlider, weightStackView, weightSlider, calcButton])
        
        addSubview(backgroundView)
        addSubview(mainStackView)
        addSubview(heightWeightStackView)
        
        titleLabel.text = "CALCULATE YOUR BMI"
        heightLabel.text = "Height"
        heightNumberLabel.text = "1.5 m"
        weightLabel.text = "Wieght"
        weightNumberLabel.text = "100 kg"
        calcButton.setTitle("Calculate", for: .normal)
    }
    
    @objc func calcTapped(_ sender: UIButton) {
        delegate?.calcTapped(sender)
    }
}
