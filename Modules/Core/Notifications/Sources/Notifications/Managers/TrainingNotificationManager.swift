//
//  TrainingNotificationManager.swift
//
//
//  Created by Ivan Semenov on 09.04.2024.
//

import UserNotifications

public final class TrainingNotificationManager {

    public static let shared = TrainingNotificationManager()
    private let notificationCenter = UNUserNotificationCenter.current()

    private init() {}
}

// MARK: - Public methods

public extension TrainingNotificationManager {

    func removeForToday() {
        let identifier = getNotificationIdentifier(for: .now)
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
    }

    func scheduleForWeek() async {
        let startDay = await isRemovedForToday() ? 1 : 0
        for dayOffset in startDay...7 {
            guard
                let notificationDate = getNotificationDate(of: dayOffset),
                let trigger = getNotificationTrigger(for: notificationDate)
            else { continue }

            let content = getNotificationContent()
            let identifier = getNotificationIdentifier(for: notificationDate)
            let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

            try? await notificationCenter.add(request)
        }
    }
}

// MARK: - Private methods

private extension TrainingNotificationManager {

    func isRemovedForToday() async -> Bool {
        let todayIdentifier = getNotificationIdentifier(for: .now)
        let pendingRequests = await notificationCenter.pendingNotificationRequests()

        return pendingRequests.isEmpty ? false : pendingRequests.contains(where: { $0.identifier == todayIdentifier }) == false
    }

    func getNotificationIdentifier(for date: Date) -> String {
        let formattedDate = DateFormatter.dateOnly.string(from: date)
        let identifier = Constants.notificationIdentifier + formattedDate
        return identifier
    }

    func getNotificationTrigger(for date: Date) -> UNNotificationTrigger? {
        let timeInterval = date.timeIntervalSinceNow
        guard timeInterval >= 0 else { return nil }

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        return trigger
    }

    func getNotificationContent() -> UNNotificationContent {
        let context = UNMutableNotificationContent()

        context.title = Strings.trainingTitle
        context.body = Strings.trainingBody
        context.sound = .default

        return context
    }

    func getNotificationDate(of day: Int) -> Date? {
        let calendar = Calendar.current

        guard
            let dayDate = calendar.date(byAdding: .day, value: day, to: .now),
            let notificationDate = calendar.date(
                bySettingHour: Constants.notificationHour,
                minute: Constants.notificationMinute,
                second: Constants.notificationSecond,
                of: dayDate
            )
        else { return nil }

        return notificationDate
    }
}

// MARK: - Constants

private extension TrainingNotificationManager {

    enum Constants {
        static let notificationHour = 20
        static let notificationMinute = 0
        static let notificationSecond = 0
        static let notificationIdentifier = "training.notification"
    }
}
