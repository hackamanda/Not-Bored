//
//  InitialView.swift
//  NotBored
//
//  Created by Amanda Hack Adriano on 06/09/22.
//

import UIKit

protocol InitialViewDelegate: AnyObject {
    func navigateToActivities()
    func navigateToTerms()
}

class InitialView: UIView {
    
    weak var delegate: InitialViewDelegate?

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Not Bored"
        label.textColor = .blue
        label.font = UIFont(name: label.font.fontName, size: 20)
        return label
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Participants"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        //button.configuration = UIButton.Configuration.plain()
        return button
    }()
    
    private lazy var termsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Terms and conditions", for: .normal)
        button.addTarget(self, action: #selector(termsButtonTapped), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        
        return button
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func startButtonTapped() {
        delegate?.navigateToActivities()
    }
    
    @objc func termsButtonTapped() {
        delegate?.navigateToTerms()
    }
}

extension InitialView: ViewCode {
    func setupSubViews() {
        addSubview(titleLabel)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(startButton)
        addSubview(termsButton)
    }
    
    func setupConstrains() {
        titleLabelConstraints()
        nameLabelConstraints()
        nameTextFieldConstraints()
        startButtonConstraints()
        termsButtonConstraints()
    }
    
    private func titleLabelConstraints() {
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func nameLabelConstraints() {
        let constraints = [
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func nameTextFieldConstraints() {
        let constraints = [
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func startButtonConstraints() {
        let constraints = [
            startButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            startButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.bottomAnchor.constraint(equalTo: termsButton.topAnchor, constant: -70),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func termsButtonConstraints() {
        let constraints = [
            termsButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            termsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
//            termsButton.heightAnchor.constraint(equalToConstant: 30),
            termsButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    func setupExtraConfiguration() { }
}
