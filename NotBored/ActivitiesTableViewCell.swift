//
//  ActivitiesTableViewCell.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 08/09/22.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {
    
    private lazy var activityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(with text: String) {
        activityLabel.text = text
        accessoryType = .disclosureIndicator
    }
}

extension ActivitiesTableViewCell: ViewCode {
    func setupSubViews() {
        contentView.addSubview(activityLabel)
    }
    
    func setupConstrains() {
        activitiesTableViewCellConstraints()
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
