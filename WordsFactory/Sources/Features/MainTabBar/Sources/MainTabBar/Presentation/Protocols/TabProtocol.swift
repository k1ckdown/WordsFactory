//
//  TabProtocol.swift
//
//
//  Created by Ivan Semenov on 06.04.2024.
//

import SwiftUI

protocol TabProtocol: Identifiable, Hashable, CaseIterable where AllCases == Array<Self> {
    var icon: Image { get }
    var title: String { get }
}

extension TabProtocol {
    var id: Self {
        self
    }
}
