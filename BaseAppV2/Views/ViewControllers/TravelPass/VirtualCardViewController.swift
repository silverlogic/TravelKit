//
//  VirtualCardViewController.swift
//  BaseAppV2
//
//  Created by Shaun Bevan on 4/23/18.
//  Copyright © 2018 SilverLogic. All rights reserved.
//

import UIKit

final class VirtualCardViewController: BaseViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// MARK: - IBAction
extension VirtualCardViewController {
    @IBAction func cashWithdrawalButtonTapped(_ sender: Any) {
        let authenicateViewController = UIStoryboard.loadAuthenicateNavigationController()
        present(authenicateViewController, animated: true, completion: nil)
    }
}
