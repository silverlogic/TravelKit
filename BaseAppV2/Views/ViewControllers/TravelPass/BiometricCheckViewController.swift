//
//  BiometricCheckViewController.swift
//  BaseAppV2
//
//  Created by Shaun Bevan on 4/23/18.
//  Copyright © 2018 SilverLogic. All rights reserved.
//

import UIKit
import LocalAuthentication

final class BiometricCheckViewController: BaseViewController {

    // MARK: - Private Instance Attributes
    private var biometrics: BiometricsAuthentication!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = nil
        biometrics = BiometricsAuthentication(LAContext())
        if biometrics.biometicsAvailable() {
            biometrics.authenicate(completion: {
                print("Next step")
            }) { (error) in
                print(error.localizedDescription)
            }
        }
    }
}
