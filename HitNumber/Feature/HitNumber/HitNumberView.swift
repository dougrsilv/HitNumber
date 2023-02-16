//
//  HitNumberView.swift
//  HitNumber
//
//  Created by Douglas  Rodrigues  on 16/02/23.
//

import UIKit

protocol HitNumberViewDelegate: AnyObject {
    func resultNumber()
    func startNumber()
}

class HitNumberView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: HitNumberViewDelegate?
    
    lazy var title: UILabel = {
        let label = UILabel.textUI.textLabel(text: Strings.title, font: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var numberOfAttempts: UILabel = {
        let label = UILabel.textUI.textLabel(text: Strings.attemptsZero, font: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var luckyNumber: UITextField = {
        let field = UITextField.textFieldUI.textUI(text: Strings.enterTheNumber)
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton.buttonUI.buttonUI(text: Strings.startButton)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlerStart), for: .touchUpInside)
        return button
    }()
    
    lazy var restartButton: UIButton = {
        let button = UIButton.buttonUI.buttonUI(text: Strings.restart)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlerRestart), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
            super.layoutSubviews()
        configureGradientLayer()
        configureUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    
    @objc func handlerStart() {
        delegate?.resultNumber()
    }
    
    @objc func handlerRestart() {
        delegate?.startNumber()
    }
    
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        layer.addSublayer(gradient)
        gradient.frame = frame
    }
    
    func configureUI() {
        
        addSubview(title)
        addSubview(numberOfAttempts)
        addSubview(luckyNumber)
        addSubview(startButton)
        addSubview(restartButton)
        
        NSLayoutConstraint.activate([
            
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 44),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            luckyNumber.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            luckyNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            luckyNumber.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            luckyNumber.heightAnchor.constraint(equalToConstant: 45),
            
            numberOfAttempts.topAnchor.constraint(equalTo: luckyNumber.bottomAnchor, constant: 4),
            numberOfAttempts.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            startButton.topAnchor.constraint(equalTo: numberOfAttempts.bottomAnchor, constant: 8),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            startButton.heightAnchor.constraint(equalToConstant: 45),
            
            restartButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 8),
            restartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            restartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            restartButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}
