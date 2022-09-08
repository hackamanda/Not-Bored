//
//  SuggestionView.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 08/09/22.
//

import UIKit

class SuggestionView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Take a bubble bath"
        label.textColor = .blue
        label.font = UIFont(name: label.font.fontName, size: 20)
        return label
    }()
    
    private lazy var participantsImage: UIImageView = {
        let image = UIImage(systemName: "person.fill")
        let imageView = UIImageView(image: image)
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return imageView
    }()
    
    private lazy var participantsLabel: UILabel = {
        let label = UILabel()
        label.text = "Participants"
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private lazy var participantsNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var stackView1: UIStackView = {
        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
//        stackView.distribution = .fill
//        stackView.alignment = .leading
        stackView.addArrangedSubview(participantsImage)
        stackView.addArrangedSubview(participantsLabel)
        stackView.addArrangedSubview(participantsNumberLabel)
        participantsImageConstraints()
        return stackView
    }()
    
    private lazy var priceImage: UIImageView = {
        let image = UIImage(systemName: "dollarsign.circle.fill")
        let imageView = UIImageView(image: image)
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return imageView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price"
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private lazy var priceLevelLabel: UILabel = {
        let label = UILabel()
        label.text = "Medium"
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
//        stackView.distribution = .fill
//        stackView.alignment = .leading
        stackView.addArrangedSubview(priceImage)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(priceLevelLabel)
        priceImageConstraints()
        return stackView
    }()
    
    private lazy var relaxationImage: UIImageView = {
        let image = UIImage(systemName: "list.bullet")
        let imageView = UIImageView(image: image)
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return imageView
    }()
    
    private lazy var relaxationLabel: UILabel = {
        let label = UILabel()
        label.text = "Relaxation"
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private lazy var relaxationLevelLabel: UILabel = {
        let label = UILabel()
        label.text = "---"
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var stackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
//        stackView.distribution = .fill
//        stackView.alignment = .leading
        stackView.addArrangedSubview(relaxationImage)
        stackView.addArrangedSubview(relaxationLabel)
        stackView.addArrangedSubview(relaxationLevelLabel)
        relaxationImageConstraints()
        return stackView
    }()
    
    private lazy var stackViewGlobal: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
//        stackView.distribution = .fill
//        stackView.alignment = .leading
        stackView.addArrangedSubview(stackView1)
        stackView.addArrangedSubview(stackView2)
        stackView.addArrangedSubview(stackView3)
        return stackView
    }()

    private lazy var tryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Try another", for: .normal)
        button.addTarget(self, action: #selector(tryButtonTapped), for: .touchUpInside)
        //button.configuration = UIButton.Configuration.plain()
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tryButtonTapped() {
        print("Try Another")
    }
}

extension SuggestionView: ViewCode {
    func setupSubViews() {
        addSubview(titleLabel)
        addSubview(stackViewGlobal)
        addSubview(tryButton)
    }
    
    func setupConstrains() {
        titleLabelConstraints()
        stackViewGlobalConstraints()
        tryButtonConstraints()
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
    
    private func stackViewGlobalConstraints() {
        let constraints = [
            stackViewGlobal.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            stackViewGlobal.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackViewGlobal.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func tryButtonConstraints() {
        let constraints = [
            tryButton.heightAnchor.constraint(equalToConstant: 50),
            tryButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tryButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tryButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func participantsImageConstraints() {
        let constraints = [
            participantsImage.heightAnchor.constraint(equalToConstant: 48),
            participantsImage.widthAnchor.constraint(equalToConstant: 48),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func priceImageConstraints() {
        let constraints = [
            priceImage.heightAnchor.constraint(equalToConstant: 48),
            priceImage.widthAnchor.constraint(equalToConstant: 48),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func relaxationImageConstraints() {
        let constraints = [
            relaxationImage.heightAnchor.constraint(equalToConstant: 48),
            relaxationImage.widthAnchor.constraint(equalToConstant: 48),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    func setupExtraConfiguration() { }
    
    
}
