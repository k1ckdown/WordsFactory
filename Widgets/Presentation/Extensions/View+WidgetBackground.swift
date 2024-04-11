//
//  View+WidgetBackground.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 08.04.2024.
//

import SwiftUI
import WidgetKit

extension View {

    @ViewBuilder
    func widgetBackground(_ color: Color = Color(.systemBackground)) -> some View {
        if #available(iOSApplicationExtension 17, *) {
            containerBackground(color, for: .widget)
        } else {
            background(color)
        }
    }
}
