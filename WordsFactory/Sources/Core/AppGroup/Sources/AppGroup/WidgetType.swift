//
//  WidgetType.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 08.04.2024.
//

public enum WidgetType: String {
    case dictionary

    public var kind: String {
        rawValue + "Widget"
    }
}
