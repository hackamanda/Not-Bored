//
//  SuggestionView.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 08/09/22.
//

import UIKit

class SuggestionView: UIView {
    // MARK: - Screen objects
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = activity.activityName
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = UIColor(red: 233/255, green: 186/255, blue: 67/255, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var participantsImage: UIImageView = {
        let image = UIImage(systemName: "person.fill")
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor(red: 233/255, green: 186/255, blue: 67/255, alpha: 1)
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return imageView
    }()
    
    private lazy var participantsLabel: UILabel = {
        let label = UILabel()
        label.text = "Participants"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private lazy var participantsNumberLabel: UILabel = {
        let label = UILabel()
        label.text = String(activity.participants)
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.addArrangedSubview(participantsImage)
        stackView.addArrangedSubview(participantsLabel)
        stackView.addArrangedSubview(participantsNumberLabel)
        participantsImageConstraints()
        return stackView
    }()
    
    private lazy var priceImage: UIImageView = {
        let image = UIImage(systemName: "dollarsign.circle.fill")
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor(red: 233/255, green: 186/255, blue: 67/255, alpha: 1)
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return imageView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private lazy var priceLevelLabel: UILabel = {
        let label = UILabel()
        label.text = activity.priceCategory
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.addArrangedSubview(priceImage)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(priceLevelLabel)
        priceImageConstraints()
        return stackView
    }()
    
    private lazy var relaxationImage: UIImageView = {
        let image = UIImage(systemName: "list.bullet")
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor(red: 233/255, green: 186/255, blue: 67/255, alpha: 1)
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return imageView
    }()
    
    private lazy var relaxationLabel: UILabel = {
        let label = UILabel()
        label.text = activity.type.capitalized
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private lazy var stackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.addArrangedSubview(relaxationImage)
        stackView.addArrangedSubview(relaxationLabel)
        relaxationImageConstraints()
        return stackView
    }()
    
    private lazy var stackViewGlobal: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [stackView1, stackView2])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        if isRamdom {
            stackView.addArrangedSubview(stackView3)
        }
        return stackView
    }()

    private lazy var tryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Try another", for: .normal)
        button.configuration = UIButton.Configuration.filled()
        button.tintColor = UIColor(red: 233/255, green: 186/255, blue: 67/255, alpha: 1)
        let color = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        button.setTitleColor(color, for: .normal)
        button.configuration?.cornerStyle = .capsule
        button.addTarget(self, action: #selector(tryButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Properties
    let activity: Activity
    let isRamdom: Bool
    let viewModel = ActivitiesViewModel()
    let target: UIViewController
    
    // MARK: - Initializers
    init(with activity: Activity, isRamdom: Bool, target: UIViewController) {
        self.activity = activity
        self.isRamdom = isRamdom
        self.target = target
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func updateView(with activity: Activity) {
        titleLabel.text = activity.activityName
        participantsNumberLabel.text = String(activity.participants)
        priceLevelLabel.text = activity.priceCategory
        relaxationLabel.text = activity.type.capitalized
    }
    
    // MARK: - Actions
    @objc func tryButtonTapped() {
        let category = isRamdom ? nil : activity.type
        viewModel.fetch(numberOfParticipants: activity.participants, category: category) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let activity):
                    self.updateView(with: activity)
                case .failure(let error):
                    Notification.show(title: "Error", message: error.rawValue, target: self.target)
                }
            }
        }
    }
}

// MARK: - View code
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
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 56),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
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
            tryButton.heightAnchor.constraint(equalToConstant: 48),
            tryButton.widthAnchor.constraint(equalToConstant: 250),
            tryButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            tryButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
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
