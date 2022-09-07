//
//  InitialView.swift
//  NotBored
//
//  Created by Amanda Hack Adriano on 06/09/22.
//

import UIKit

class InitialView: UIView {

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
        
        return textField
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Start", for: .normal)
        //button.configuration = UIButton.Configuration.plain()
        return button
    }()
    
    private lazy var termsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Terms and conditions", for: .normal)
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
        let titleLabelTop = titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50)
        let titleLabelCenterX = titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        let nameLabelTop = nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30)
        let nameLabelLeading = nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
        
        let nameTextFieldTop = nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20)
        let nameTextFieldLeading = nameTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
        let nameTextFieldTrailing = nameTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        
        let startButtonBottom = startButton.bottomAnchor.constraint(equalTo: termsButton.topAnchor, constant: -70)
        let startButtonLeading = startButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
        let startButtonTrailing = startButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        let startButtonHeight = startButton.heightAnchor.constraint(equalToConstant: 50)
        
        let termsButtonBottom = termsButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)
        let termsButtonLeading = termsButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
        let termsButtonTrailing = termsButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 20)
        let termsButtonHeight = termsButton.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([
            titleLabelTop, titleLabelCenterX,
            nameLabelTop, nameLabelLeading,
            nameTextFieldTop, nameTextFieldLeading, nameTextFieldTrailing,
            startButtonBottom, startButtonLeading, startButtonTrailing, startButtonHeight,
            termsButtonBottom, termsButtonLeading, termsButtonTrailing, termsButtonHeight
        ])
    }
    
    func setupExtraConfiguration() {
        
    }
    
    
}
