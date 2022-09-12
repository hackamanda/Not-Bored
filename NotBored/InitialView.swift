//
//  InitialView.swift
//  NotBored
//
//  Created by Amanda Hack Adriano on 06/09/22.
//

import UIKit

class InitialView: UIView {
    // MARK: - Screen objects
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Not Bored"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = UIColor(red: 233/255, green: 186/255, blue: 67/255, alpha: 1)
        return label
    }()

    private lazy var participantsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Participants"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return label
    }()
    
    private lazy var participantsTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(red: 64/255, green: 64/255, blue: 64/255, alpha: 1)
        textField.textColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        return textField
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        button.configuration = UIButton.Configuration.filled()
        button.tintColor = UIColor(red: 233/255, green: 186/255, blue: 67/255, alpha: 1)
        let color = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        button.setTitleColor(color, for: .normal)
        button.setTitleColor(color, for: .disabled)
        button.configuration?.cornerStyle = .capsule
        button.isEnabled = false
        return button
    }()
    
    private lazy var termsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Terms and conditions", for: .normal)
        button.addTarget(self, action: #selector(termsButtonTapped), for: .touchUpInside)
        let color = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        button.setTitleColor(color, for: .normal)
        
        return button
    }()
    
    // MARK: - Properties
    weak var delegate: InitialViewDelegateProtocol?

    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    @objc func textFieldDidChange() {
        guard let text = participantsTextField.text,
            let number = Int(text),
            number > 0
        else {
            startButton.isEnabled = false
            return
        }
        startButton.isEnabled = true
    }
    
    // MARK: - Actions
    @objc func startButtonTapped() {
        guard
            let participantsText = participantsTextField.text,
            let participants = Int(participantsText)
        else {
            return
        }
        delegate?.navigateToActivities(numberOfParticipants: participants)
    }
    
    @objc func termsButtonTapped() {
        delegate?.navigateToTerms()
    }
}

// MARK: - View code
extension InitialView: ViewCode {
    func setupSubViews() {
        addSubview(titleLabel)
        addSubview(participantsLabel)
        addSubview(participantsTextField)
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
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 56),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func nameLabelConstraints() {
        let constraints = [
            participantsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 112),
            participantsLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func nameTextFieldConstraints() {
        let constraints = [
            participantsTextField.topAnchor.constraint(equalTo: participantsLabel.bottomAnchor, constant: 24),
            participantsTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            participantsTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            participantsTextField.heightAnchor.constraint(equalToConstant: 56)
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func startButtonConstraints() {
        let constraints = [
            startButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 250),
            startButton.heightAnchor.constraint(equalToConstant: 48),
            startButton.bottomAnchor.constraint(equalTo: termsButton.topAnchor, constant: -24),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func termsButtonConstraints() {
        let constraints = [
            termsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            termsButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    func setupExtraConfiguration() { }
}
