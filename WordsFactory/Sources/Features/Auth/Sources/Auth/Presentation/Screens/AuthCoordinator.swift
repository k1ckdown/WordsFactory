//
//  AuthCoordinator.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

public struct AuthCoordinator: View {
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            SignUpAssembly.assemble()
        }
    }
}

#Preview {
    AuthCoordinator()
}
