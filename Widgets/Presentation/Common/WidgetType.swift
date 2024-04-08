//
//  WidgetType.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 08.04.2024.
//

enum WidgetType: String {
    case dictionary

    var kind: String {
        rawValue + "Widget"
    }
}
