//
//  ActivitiesView.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 08/09/22.
//

import UIKit

protocol ActivitiesViewDelegate: AnyObject {
    func navigateToSuggestion()
}

class ActivitiesView: UIView {
    
    weak var delegate: ActivitiesViewDelegate?

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ActivitiesTableViewCell.self, forCellReuseIdentifier: activitiesTableViewCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private let activitiesTableViewCellIdentifier = "ActivitiesTableViewCell"
    var activities: [String] = []
    
    init() {
        super.init(frame: .zero)
        setup()
        
        activities.append("Elemento 1")
        activities.append("Elemento 2")
        activities.append("Elemento 3")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ActivitiesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: activitiesTableViewCellIdentifier) as? ActivitiesTableViewCell else {
            return UITableViewCell()
        }
        let index = indexPath.row
        cell.updateCell(with: activities[index])
        return cell
    }
}

extension ActivitiesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        delegate?.navigateToSuggestion()
    }
}

extension ActivitiesView: ViewCode {
    func setupSubViews() {
        addSubview(tableView)
    }
    
    func setupConstrains() {
        tableViewConstraints()
    }
    
    private func tableViewConstraints() {
        let constraints = [
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    func setupExtraConfiguration() { }
}
