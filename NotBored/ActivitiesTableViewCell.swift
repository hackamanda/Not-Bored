//
//  ActivitiesTableViewCell.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 08/09/22.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {
    // MARK: - Screen objects
    private lazy var activityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return label
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        configCell()
    }
    
    // MARK: - Methods
    func configCell() {
        accessoryType = .disclosureIndicator
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 96/255, green: 96/255, blue: 96/255, alpha: 1).cgColor
        layer.cornerRadius = 16
        clipsToBounds = true
        backgroundColor = UIColor(red: 64/255, green: 64/255, blue: 64/255, alpha: 1)
    }
    func updateCell(with text: String) {
        contentView.tintColor = .orange
        activityLabel.text = text.capitalized
    }
}

// MARK: - View code
extension ActivitiesTableViewCell: ViewCode {
    func setupSubViews() {
        contentView.addSubview(activityLabel)
    }
    
    func setupConstrains() {
        contentViewConstraints()
        activitiesTableViewCellConstraints()
    }
    
    private func contentViewConstraints() {
        let constraints = [
            contentView.heightAnchor.constraint(equalToConstant: 72),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func activitiesTableViewCellConstraints() {
        let constraints = [
            activityLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            activityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    func setupExtraConfiguration() { }
}
