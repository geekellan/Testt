//
//  FirstContentView.swift
//  Test
//
//  Created by Ellan Esenaliev on 10/2/20.
//

import UIKit

class FirstContentView: UIView {
    
    lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupSubViews()
        setupContraits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        backgroundColor = .white
    }
    
    func setupSubViews() {
        addSubview(tableView)
    }
    
    func setupContraits() {
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
