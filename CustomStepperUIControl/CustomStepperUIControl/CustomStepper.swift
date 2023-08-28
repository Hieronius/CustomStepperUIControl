//
//  CustomStepper.swift
//  CustomStepperUIControl
//
//  Created by Арсентий Халимовский on 26.08.2023.
//

import UIKit

final class CustomStepper: UIControl {
    
    // MARK: - Public Properties
    
    var currentValue = 1 {
        didSet {
            currentValue = currentValue > 0 ? currentValue : 0
            currentStepValueLabel.text = "\(currentValue)"
        }
    }
    
    // MARK: - Private Properties
    
    private lazy var decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("-", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var increaseButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var currentStepValueLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.text = "\(currentValue)"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: UIFont.Weight.regular)
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
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
    
    // MARK: - Private Methods
    
    private func setupViews() {
        addSubview(decreaseButton)
        addSubview(currentStepValueLabel)
        addSubview(increaseButton)
    }
    
    private func setupConstraints() {
        decreaseButton.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
        }
        
        currentStepValueLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(decreaseButton.snp.trailing)
        }
        
        increaseButton.snp.makeConstraints {
            $0.trailing.top.bottom.equalToSuperview()
            $0.leading.equalTo(currentStepValueLabel.snp.trailing)
            $0.width.equalTo(decreaseButton.snp.width)
        }
        
    }
            
}
