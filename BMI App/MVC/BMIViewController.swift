//
//  BMIViewController.swift
//  BMI App
//
//  Created by Liz-Mary on 08.11.2023.
//

import UIKit

class BMIViewController: UIViewController {
    
    let bmiView = BMIView()
    
//MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.addSubview(bmiView.backgroundView)
        view.addSubview(bmiView.mainStackView)
        
        NSLayoutConstraint.activate([
        bmiView.backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
        bmiView.backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        bmiView.backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        bmiView.backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        bmiView.mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        bmiView.mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        bmiView.mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        bmiView.mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
    }

}

