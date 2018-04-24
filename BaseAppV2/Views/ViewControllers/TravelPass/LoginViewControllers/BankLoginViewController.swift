//
//  BankLoginViewController.swift
//  BaseAppV2
//
//  Created by Shaun Bevan on 4/23/18.
//  Copyright © 2018 SilverLogic. All rights reserved.
//

import UIKit

final class BankLoginViewController: BaseViewController {

    // MARK: - IBOulets
    @IBOutlet private weak var usernameTextField: BaseTextField!
    @IBOutlet private weak var passwordTextField: BaseTextField!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}


// MARK: - IBActions
extension BankLoginViewController {
    @IBAction func loginButtonTapped(_ sender: BaseButton) {
        let accountBalance = UIStoryboard.loadAccountBalanceNavigationController()
        present(accountBalance, animated: true, completion: nil)
    }
}


// MARK: - UITextFieldDelegate
extension BankLoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if (textField == usernameTextField) {
            passwordTextField.becomeFirstResponder()
        }
        return true
    }
}


// MARK: - Private Instance Methods
extension BankLoginViewController {
    func setup() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
}
