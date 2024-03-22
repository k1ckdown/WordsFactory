//
//  AuthRouter.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

public struct AuthRouter: View {

    public init() {}

    public var body: some View {
        NavigationView {
            SignUpAssembly.assemble()
        }
    }
}

#Preview {
    AuthRouter()
}
