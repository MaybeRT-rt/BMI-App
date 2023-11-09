//
//  CalculateView.swift
//  BMI App
//
//  Created by Liz-Mary on 08.11.2023.
//

import UIKit

protocol CalculateDelegate: AnyObject {
    func calcTapped(_ sender: UIButton)
    func heightSliderChange(_ sender: UISlider)
    func weightSliderChange(_ sender: UISlider)
}

class CalculateView: UIView {
    
    weak var delegate: CalculateDelegate?
    
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
    
    let calcButton = UIButton(isBackgroungWhite: false)
    
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
        
        calcButton.addTarget(self, action: #selector(calcTapped), for: .touchUpInside)
        heightSlider.addTarget(self, action: #selector(heightSliderChange), for: .valueChanged)
        weightSlider.addTarget(self, action: #selector(weightSliderChange), for: .valueChanged)
    }
    
    @objc func calcTapped(_ sender: UIButton) {
        delegate?.calcTapped(sender)
    }
    
    @objc func heightSliderChange(_ sender: UISlider) {
        delegate?.heightSliderChange(sender)
    }
    
    @objc func weightSliderChange(_ sender: UISlider) {
        delegate?.weightSliderChange(sender)
    }
    
}
