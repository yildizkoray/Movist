//
//  GetTopRatedTask.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 14.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation
import Alamofire

public struct GetTopRatedTask: APITask {
    
    public var method: HTTPMethod = .get
    public var path: String = "/movie/top_rated"
}
