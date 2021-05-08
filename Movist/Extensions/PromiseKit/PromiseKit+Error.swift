//
//  PromiseKit+Error.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 24.10.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import PromiseKit
import UIKit

public extension PromiseKit.Thenable {
    
    @discardableResult func alertOnError() -> Self {
        return error { error in
            AlertService.show(alert: .error(error))
        }
    }
    
    @discardableResult func error(action: @escaping Callback<Error>) -> Self {
        return pipe {
            guard let error = $0.error else { return }
            action(error.underlyingError)
        }
    }
    
    func pipe(to block: @escaping Callback<PromiseKit.Result<Self.T>>) -> Self {
        pipe(to: block)
        return self
    }
}

// MARK: - Error

fileprivate extension Error {
    
    var underlyingError: Error {
        return (asAFError?.underlyingError).ifNil(self)
    }
}

public extension Error {
    
    var asAPIError: APIError? {
        return self as? APIError
    }
}

// MARK: - PromiseKit.Result

fileprivate extension PromiseKit.Result {
    var error: Error? {
        switch self {
        case .rejected(let error):
            return error
        default:
            return nil
        }
    }
}
