//
//  FirstVC.swift
//  Test
//
//  Created by Ellan Esenaliev on 10/2/20.
//

import UIKit

class FirstVC: UIViewController {
    
    lazy var contentView = FirstContentView()
    lazy var refresh: UIRefreshControl = {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(load), for: .valueChanged)
        return control
    }()
    var loader: FeedLoader!
    
    var entities: [Presentable] = [] {
        didSet {
            DispatchQueue.main.async {
                self.refresh.endRefreshing()
                self.contentView.tableView.reloadData()
            }
        }
    }
    
    convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    override func loadView() {
        view = contentView
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentView()
        load()
    }
    
    @objc
    private func load() {
        loader.load { [weak self] entities in
            self?.entities = entities
        }
    }
    
    private func setupContentView() {
        contentView.tableView.refreshControl = refresh
        contentView.tableView.register(FirstCell.self, forCellReuseIdentifier: FirstCell.identifier)
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }
}

extension FirstVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let entity = entities[indexPath.row]
        present(SecondVC(entity: entity), animated: true, completion: nil)
    }
}

extension FirstVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstCell.identifier) as! FirstCell
        cell.textLabel?.text = entities[indexPath.row].title
        cell.accessoryType = .detailButton
        return cell
    }
}
