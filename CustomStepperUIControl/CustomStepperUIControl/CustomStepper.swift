//
//  CustomStepper.swift
//  CustomStepperUIControl
//
//  Created by Арсентий Халимовский on 26.08.2023.
//

import UIKit

final class CustomStepper: UIControl {
    var currentValue = 1 {
        didSet {
            currentValue = currentValue > 0 ? currentValue : 0
            currentStepValueLabel.text = "\(currentValue)"
        }
    }
    
    private lazy var decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("-", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside
        return button
    }()
    
    private lazy var increaseButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside
        return button
    }()
    
    private lazy var currentStepValueLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.text = "\(currentValue)"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: UIFont.Weight.regular)
        return label
    }()
}
