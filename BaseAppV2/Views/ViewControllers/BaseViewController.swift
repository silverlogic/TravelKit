//
//  BaseViewController.swift
//  BaseAppV2
//
//  Created by Emanuel  Guerrero on 3/14/17.
//  Copyright © 2017 SilverLogic. All rights reserved.
//

import Foundation

/// A base class for having subclasses of `UIViewController`. It also defines and sets default attributes for
/// an instance.
class BaseViewController: UIViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.text = "BANCO DEL PERU"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "icon-hamburger35"), style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = .white
    }
}
