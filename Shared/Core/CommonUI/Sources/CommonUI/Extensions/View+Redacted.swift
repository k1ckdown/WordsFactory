//
//  View+Redacted.swift
//
//
//  Created by Ivan Semenov on 28.03.2024.
//

import SwiftUI

public extension View {
    func redacted(if condition: Bool, disable: Bool = true) -> some View {
        redacted(reason: condition ? .placeholder : [])
            .disabled(disable ? condition : false)
    }
}
