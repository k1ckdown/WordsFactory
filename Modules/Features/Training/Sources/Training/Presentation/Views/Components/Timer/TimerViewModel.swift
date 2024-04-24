//
//  TimerViewModel.swift
//
//
//  Created by Ivan Semenov on 01.04.2024.
//

import Foundation

final class TimerViewModel: ObservableObject, Equatable {

    var fractionRemained: Double {
        max(0, progress / total)
    }

    @Published private(set) var progress: Double
    private var timer: Timer?
    private let total: Double

    init(total: Double = Constants.defaultTotal) {
        progress = total
        self.total = total
    }

    static func == (lhs: TimerViewModel, rhs: TimerViewModel) -> Bool {
        lhs.progress == rhs.progress
    }
}

// MARK: - Public methods

extension TimerViewModel {

    func resumeTimer() {
        startTimer()
    }

    func pauseTimer() {
        timer?.invalidate()
    }

    func repeatTimer() {
        progress = total
        if timer?.isValid == false { startTimer() }
    }

    func startTimer() {
        guard timer == nil || timer?.isValid == false else { return }
        
        timer = Timer.scheduledTimer(withTimeInterval: Constants.interval, repeats: true) { [weak self] _ in
            guard let self else { return }

            progress -= Constants.interval
            if progress.isLess(than: 0) { pauseTimer() }
        }
    }
}

// MARK: - Constants

private extension TimerViewModel {

    enum Constants {
        static let interval: Double = 0.01
        static let defaultTotal: Double = 5
    }
}
