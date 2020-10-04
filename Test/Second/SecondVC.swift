//
//  SecondVC.swift
//  Test
//
//  Created by Ellan Esenaliev on 10/4/20.
//

import UIKit

class SecondVC: UIViewController {
    
    lazy var contentView = SecondContentView()
    var entity: Presentable!
    
    convenience init(entity: Presentable) {
        self.init()
        self.entity = entity
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.titleLabel.text = entity.title
        contentView.subTitleLabel.text = entity.details
    }
}
