//
//  API.swift
//  Movist
//
//  Created by Koray Yıldız on 12.12.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public protocol API {
    
    associatedtype Executable
    associatedtype Operation
    
    func execute(task: Operation) -> Executable
}
