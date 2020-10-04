//
//  SecondContentView.swift
//  Test
//
//  Created by Ellan Esenaliev on 10/4/20.
//

import UIKit

class SecondContentView: UIView {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupSubviews()
        setupContraits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        backgroundColor = .white
    }
    
    func setupSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)
    }
    
    func setupContraits() {
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
}
