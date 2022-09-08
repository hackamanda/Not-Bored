//
//  TermsView.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 07/09/22.
//

import Foundation
import UIKit

protocol TermsViewDelegate: AnyObject {
    func returnToInitial()
}

class TermsView: UIView {
    
    weak var delegate: TermsViewDelegate?
    
    private lazy var termsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("X", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Terms and conditions"
        label.textColor = .blue
        label.font = UIFont(name: label.font.fontName, size: 20)
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Not Bored"
        label.textColor = .blue
        label.font = UIFont(name: label.font.fontName, size: 20)
        return label
    }()
    
    private lazy var termsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = getTerms()
        label.textColor = .blue
        label.numberOfLines = 0
        label.font = UIFont(name: label.font.fontName, size: 20)
        return label
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subTitleLabel)
        view.addSubview(termsLabel)
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        return scrollView
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func closeButtonTapped() {
        delegate?.returnToInitial()
    }
    
    func getTerms() -> String {
        return "The standard Lorem Ipsum passage, used since the 1500s \n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nSection 1.10.32 of de Finibus Bonorum et Malorum, written by Cicero in 45 BC\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"

    }
}

extension TermsView: ViewCode {
    func setupSubViews() {
        addSubview(termsButton)
        addSubview(titleLabel)
        addSubview(scrollView)
    }
    
    func setupConstrains() {
        termsButtonConstraints()
        titleLabelConstraints()
        scrollViewConstraints()
        contentViewConstraints()
        subTitleLabelConstraints()
        termsLabelConstraints()
    }
    
    private func termsButtonConstraints() {
        let constraints = [
            termsButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            termsButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func titleLabelConstraints() {
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: termsButton.bottomAnchor, constant: 32),
            titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func scrollViewConstraints() {
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func subTitleLabelConstraints() {
        let constraints = [
            subTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            subTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func termsLabelConstraints() {
        let constraints = [
            termsLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 16),
            termsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            termsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            termsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func contentViewConstraints() {
        let constraints = [
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    func setupExtraConfiguration() { }
    
    
}
