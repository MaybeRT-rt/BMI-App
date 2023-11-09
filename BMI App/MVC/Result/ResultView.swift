//
//  ResultView.swift
//  BMI App
//
//  Created by Liz-Mary on 09.11.2023.
//

import UIKit

protocol ReCalculateDelegate: AnyObject {
    func reCalcTapped(_ sender: UIButton)
}

class ResultView: UIView {
    
    weak var delegate: ReCalculateDelegate?
    
    lazy var backgroundView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "result_background")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 35, weight: .bold)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var resultLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 80, weight: .bold)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var descriptionLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 40, weight: .light)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var mainStackView = UIStackView()
    
    let recalcButton = UIButton(isBackgroungWhite: true)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        mainStackView = UIStackView(axis: .vertical, distribution: .fillEqually, subview: [titleLabel, resultLabel, descriptionLabel])
        
        addSubview(backgroundView)
        addSubview(mainStackView)

        
        titleLabel.text = "YOUR RESULT"
        resultLabel.text = "19.5"
        descriptionLabel.text = "EAT SOME MORE SHACKS"
        
        recalcButton.addTarget(self, action: #selector(reCalcTapped), for: .touchUpInside)
    }
    
    @objc func reCalcTapped(_ sender: UIButton) {
        delegate?.reCalcTapped(sender)
    }
}
