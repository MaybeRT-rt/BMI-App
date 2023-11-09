//
//  ResultViewController.swift
//  BMI App
//
//  Created by Liz-Mary on 09.11.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    let resultView = ResultView()
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
        resultView.delegate = self
        setupUI()
    }
    
    func setupUI() {
        
        resultView.resultLabel.text = bmiValue
        resultView.descriptionLabel.text = advice
        
        view.addSubview(resultView.backgroundView)
        view.addSubview(resultView.mainStackView)
        view.addSubview(resultView.recalcButton)
        
        
        NSLayoutConstraint.activate([
            resultView.backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            resultView.backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultView.backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultView.backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            resultView.mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultView.mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            resultView.mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            resultView.mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            resultView.recalcButton.heightAnchor.constraint(equalToConstant: 51),
            resultView.recalcButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            resultView.recalcButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            resultView.recalcButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}

extension ResultViewController: ReCalculateDelegate {
    
    func reCalcTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
