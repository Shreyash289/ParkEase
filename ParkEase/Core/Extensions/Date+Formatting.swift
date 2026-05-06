import Foundation

extension Date {
    var shortTime: String {
        formatted(date: .omitted, time: .shortened)
    }

    var shortDate: String {
        formatted(date: .abbreviated, time: .omitted)
    }
}
