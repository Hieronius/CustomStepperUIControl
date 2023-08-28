////
////  TestCode.swift
////  CustomStepperUIControl
////
////  Created by Арсентий Халимовский on 28.08.2023.
////
//
//import Foundation
//
//final class CustomStepper: UIControl {
//
//    // ... existing code
//
//    // MARK: - Private Properties
//
//    private lazy var decreaseButton: UIButton = {
//        let button = UIButton()
//        button.setTitleColor(.black, for: .normal)
//        button.setTitle("-", for: .normal)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        return button
//    }()
//
//    private lazy var increaseButton: UIButton = {
//        let button = UIButton()
//        button.setTitleColor(.black, for: .normal)
//        button.setTitle("+", for: .normal)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        return button
//    }()
//
//    private lazy var currentStepValueLabel: UILabel = {
//        var label = UILabel()
//        label.textColor = .black
//        label.text = "\(currentValue)"
//        label.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: UIFont.Weight.regular)
//        return label
//    }()
//
//    // MARK: - Life Cycle
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        setupViews()
//        setupConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//
//        setupViews()
//        setupConstraints()
//    }
//
//    // MARK: - Private Methods
//
//    private func setupViews() {
//        addSubview(decreaseButton)
//        addSubview(increaseButton)
//        addSubview(currentStepValueLabel)
//    }
//
//    private func setupConstraints() {
//        decreaseButton.snp.makeConstraints {
//            $0.leading.top.bottom.equalToSuperview()
//        }
//
//        increaseButton.snp.makeConstraints {
//            $0.trailing.top.bottom.equalToSuperview()
//            $0.leading.equalTo(decreaseButton.snp.trailing)
//            $0.width.equalTo(decreaseButton.snp.width)
//        }
//
//        currentStepValueLabel.snp.makeConstraints {
//            $0.top.bottom.equalToSuperview()
//            $0.leading.equalTo(decreaseButton.snp.trailing)
//            $0.trailing.equalTo(increaseButton.snp.leading)
//        }
//    }
//
//    // ... existing code
//
//}
