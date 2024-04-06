//
//  TabProtocol.swift
//
//
//  Created by Ivan Semenov on 06.04.2024.
//

import SwiftUI

protocol TabProtocol: Hashable, CaseIterable where AllCases == Array<Self> {
    var icon: Image { get }
    var title: String { get }
}
