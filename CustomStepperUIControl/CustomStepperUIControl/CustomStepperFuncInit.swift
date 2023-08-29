//
//  CustomStepperFuncInit.swift
//  CustomStepperUIControl
//
//  Created by Арсентий Халимовский on 29.08.2023.
//

import UIKit

final class CustomStepper: UIControl {
    
    // MARK: - Public Properties
    
    var currentValue = 0 {
        didSet {
            currentValue = currentValue > 0 ? currentValue : 0
            currentStepValueLabel.text = "\(currentValue)"
        }
    }
    
    // MARK: - Private Properties
    
    private var decreaseButton = UIButton()
    private var currentStepValueLabel = UILabel()
    private var increaseButton = UIButton()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStepper()
        setupDecreaseButton()
        setupCurrentStepValueLabel()
        setupIncreaseButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - IBActions
    
    @objc private func buttonAction(_ sender: UIButton) {
        switch sender {
        case decreaseButton:
            currentValue -= 1
        case increaseButton:
            currentValue += 1
        default:
            break
        }
        sendActions(for: .valueChanged)
    }
    
    @objc private func stepperChangedValueAction(sender: CustomStepper) {
        print(sender)
        print(sender.currentValue)
    }
    
    // MARK: - Private Methods
    
    private func setupStepper() {
        self.layer.cornerRadius = 15
        self.backgroundColor = .lightGray.withAlphaComponent(0.1)
        self.addTarget(self, action: #selector(stepperChangedValueAction), for: .valueChanged)
    }
    
    private func setupDecreaseButton() {
        decreaseButton.setTitleColor(.gray, for: .normal)
        decreaseButton.setTitle("-", for: .normal)
        decreaseButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        decreaseButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.addSubview(decreaseButton)
        
        decreaseButton.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
        }
    }
    
    private func setupCurrentStepValueLabel() {
        currentStepValueLabel.textColor = .gray
        currentStepValueLabel.text = "\(currentValue)"
        currentStepValueLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.regular)
        
        self.addSubview(currentStepValueLabel)
        
        currentStepValueLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(decreaseButton.snp.trailing).offset(10)
        }
    }
    
    private func setupIncreaseButton() {
        increaseButton.setTitleColor(.gray, for: .normal)
        increaseButton.setTitle("+", for: .normal)
        increaseButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        increaseButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.addSubview(increaseButton)
        
        increaseButton.snp.makeConstraints {
            $0.trailing.top.bottom.equalToSuperview()
            $0.leading.equalTo(currentStepValueLabel.snp.trailing).offset(10)
            $0.width.equalTo(decreaseButton.snp.width)
        }
    }
}
