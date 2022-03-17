//
//  FeatureProvider.swift
//  Find Study Group
//
//  Created by JungpyoHong on 3/15/22.
//

import Foundation

// MARK: - FeatureProvidable
public protocol DefaultsValueType {}

extension Bool: DefaultsValueType {}

open class DefaultsKeys {
    fileprivate init() {}
}

public final class DefaultsKey<T: DefaultsValueType>: DefaultsKeys {
    public let key: String
    
    public init(_ key: String) {
        self.key = key
        super.init()
    }
}

public enum FeatureFlag: String, CaseIterable {
    case message = "Backend Disable"
    case homeScreen = "Home Screen"
    
    var defaultsKey: DefaultsKey<Bool> {
        DefaultsKey<Bool>(rawValue)
    }
    
    public var defaultValue: Bool {
        let onByDefault: Set<FeatureFlag> = [
            .message,
            .homeScreen]
        return onByDefault.contains(self)
    }
}

public protocol FeatureProvidable {
    func isFeatureEnabled(flag: FeatureFlag) -> Bool
}

