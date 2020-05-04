//
//  ConfigReader.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 5.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

fileprivate struct Constants {
    
    struct Key {
        static let config = "Config"
    }
}

public final class ConfigReader {
    
    static let shared = ConfigReader()
    
    private let config: [String: Any] = Bundle.main.infoDictionaryValue(for: Constants.Key.config)

    public subscript<E>(key: String, default defaultValue: @escaping @autoclosure () -> E) -> E {
      return config[key, default: defaultValue()] as! E
    }

    public subscript(key: String) -> String {
      return self[key, default: .empty]
    }
}
