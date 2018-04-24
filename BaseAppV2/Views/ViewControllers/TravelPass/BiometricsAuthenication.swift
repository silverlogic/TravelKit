//
//  BiometricsAuthentication.swift
//  BaseAppV2
//
//  Created by Shaun Bevan on 3/1/18.
//  Copyright © 2018 SilverLogic. All rights reserved.
//

import Foundation
import LocalAuthentication

/// A class to authenicate users with biometics.
final class BiometricsAuthentication: NSObject {

    // MARK: - Private Instance Attributes
    private var context: LAContext!


    // MARK: - Initializers
    init(_ context: LAContext) {
        super.init()
        context.localizedFallbackTitle = ""
        self.context = context
    }
}


// MARK: - Public Instance Methods
extension BiometricsAuthentication {

    /// Check for biometics availability.
    ///
    /// - Returns: Returns a `Bool` indiciating if biometics is available.
    func biometicsAvailable() -> Bool {
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }

    /// Authenicates a user via biometics.
    ///
    /// - Parameters:
    ///   - success: A closure that gets invoked if authenication was successful.
    ///   - failure: A closure that gets invoked if authenication failed. Passes
    ///              a `BaseError` object that contains the error that occured.
    func authenicate(completion: @escaping () -> Void,
                     failure: @escaping (BaseError) -> Void) {
        guard biometicsAvailable() else {
            failure(BaseError.noBiometricsError)
            return
        }
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: NSLocalizedString(
                                "Biometrics.Message", comment: "message")) { success, error in
                                    if success {
                                        completion()
                                    } else {
                                        guard let biometricError = error as? LAError else {
                                            failure(BaseError.biometricsCheckError)
                                            return
                                        }
                                        switch biometricError.code {
                                        case .touchIDLockout:
                                            failure(BaseError.retryBiometricsError)
                                        case .touchIDNotAvailable:
                                            failure(BaseError.noBiometricsError)
                                        default:
                                            failure(BaseError.biometricsCheckError)
                                        }
                                    }
        }
    }
}


// MARK: - Mock LAContext

/// A mock class for biometics availability and successful user verification.
final class MockLAContext: LAContext {
    override func evaluatePolicy(_ policy: LAPolicy,
                                 localizedReason: String,
                                 reply: @escaping (Bool, Error?) -> Void) {
        reply(true, nil)
    }

    override func canEvaluatePolicy(_ policy: LAPolicy, error: NSErrorPointer) -> Bool { return true }
}
