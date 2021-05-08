//
//  Service.swift
//  Movist
//
//  Created by Koray Yıldız on 12.12.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import PromiseKit

public protocol Service: AnyObject {
    
    associatedtype Backend: API
    
    init(backend: Backend)
    
    func execute<R: APIResponse>(task: Backend.Operation) -> Promise<R>
}
