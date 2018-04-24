//
//  IDAuthViewController.swift
//  BaseAppV2
//
//  Created by Shaun Bevan on 4/24/18.
//  Copyright © 2018 SilverLogic. All rights reserved.
//

import UIKit

final class IDAuthViewController: BaseViewController {

    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = nil
    }
}


// MARK: - IBActions
extension IDAuthViewController {
    @IBAction func skipButtonTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
