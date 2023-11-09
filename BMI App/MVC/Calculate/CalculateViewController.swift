//
//  CalculateViewController.swift
//  BMI App
//
//  Created by Liz-Mary on 08.11.2023.
//

import UIKit

class CalculateViewController: UIViewController {
    
    let bmiView = CalculateView()
    let calcBrain = CalcBrain()
    
//MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiView.delegate = self
        setupUI()
    }

    func setupUI() {
        view.addSubview(bmiView.backgroundView)
        view.addSubview(bmiView.mainStackView)
        bmiView.mainStackView.addSubview(bmiView.heightStackView)
        bmiView.mainStackView.addSubview(bmiView.weightStackView)
        
        NSLayoutConstraint.activate([
        bmiView.backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
        bmiView.backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        bmiView.backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        bmiView.backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        bmiView.mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        bmiView.mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        bmiView.mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        bmiView.mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
        bmiView.heightStackView.heightAnchor.constraint(equalToConstant: 21),
        bmiView.heightSlider.heightAnchor.constraint(equalToConstant: 61),
        bmiView.weightStackView.heightAnchor.constraint(equalToConstant: 21),
        bmiView.weightSlider.heightAnchor.constraint(equalToConstant: 61),
        
        bmiView.calcButton.heightAnchor.constraint(equalToConstant: 51)
        ])
    }
}

extension CalculateViewController: CalculateDelegate {
    
    func calcTapped(_ sender: UIButton) {
        let resultVC = ResultViewController()
        
        resultVC.modalTransitionStyle = .flipHorizontal
        resultVC.modalPresentationStyle = .fullScreen
        
        present(resultVC, animated: true)
    }
    
    func heightSliderChange(_ sender: UISlider) {
        bmiView.heightNumberLabel.text = String(format: "%.2f", sender.value) + "m"
    }
    
    func weightSliderChange(_ sender: UISlider) {
        bmiView.weightNumberLabel.text = String(format: "%.0f", sender.value) + "Kg"
    }
    
    
}
