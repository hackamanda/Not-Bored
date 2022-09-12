//
//  ActivitiesView.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 08/09/22.
//

import UIKit

class ActivitiesView: UIView {
    // MARK: - Screen objects
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 32/255, green: 32/255, blue: 32/255, alpha: 1)
        tableView.register(ActivitiesTableViewCell.self, forCellReuseIdentifier: activitiesTableViewCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Properties
    let viewModel = ActivitiesViewModel()
    weak var delegate: ActivitiesViewDelegateProtocol?
    private let activitiesTableViewCellIdentifier = "ActivitiesTableViewCell"
    
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        setup()
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Table view data source
extension ActivitiesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: activitiesTableViewCellIdentifier) as? ActivitiesTableViewCell else {
            return UITableViewCell()
        }
        let index = indexPath.row
        let activityType = viewModel.currentActivity(inPosition: index)
        cell.updateCell(with: activityType.category)
        
        // Levar isso para dentro da celula
        cell.accessoryType = .disclosureIndicator
        cell.tintColor = UIColor(red: 233/255, green: 186/255, blue: 67/255, alpha: 1)
        let image = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysTemplate)
        let checkmark  = UIImageView(frame:CGRect(x:0, y:0, width:(image?.size.width)!, height:(image?.size.height)!));
        checkmark.image = image
        cell.accessoryView = checkmark
        
        return cell
    }
}

// MARK: - Table view delegate
extension ActivitiesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.activityCellTapped(activityType: viewModel.currentActivity(inPosition: indexPath.row))
    }
}

// MARK: - Activities view model delegate
extension ActivitiesView: ActivitiesViewModelDelegateProtocol {
    func reloadData() {
        tableView.reloadData()
    }
}

// MARK: - View code
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
