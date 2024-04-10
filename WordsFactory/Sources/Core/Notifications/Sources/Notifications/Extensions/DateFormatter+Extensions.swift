//
//  DateFormatter+Extensions.swift
//
//
//  Created by Ivan Semenov on 10.04.2024.
//

import Foundation

extension DateFormatter {

    static let dateOnly: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateOnlyFormat
        return formatter
    }()
}

private extension DateFormatter {

    enum Constants {
        static let dateOnlyFormat = "dd.MM.YYY"
    }
}
