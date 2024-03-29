//
//  ViewController.swift
//  CustomStepperUIControl
//
//  Created by Арсентий Халимовский on 26.08.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var stepperView = CustomStepper()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        print("load is done")
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(stepperView)
        
    }
    
    private func setupConstraints() {
        stepperView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
}
