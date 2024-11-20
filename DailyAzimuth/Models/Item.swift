//
//  Item.swift
//  DailyAzimuth
//
//  Created by Joseph DeWeese on 11/20/24.
//
import SwiftData
import SwiftUI



@Model
final class Item {
    var timestamp: Date
    var title: String = ""
    var summary: String = ""
    var symbol: String = ""
    var dateAdded: Date = Date.now
    var dateStarted: Date = Date.distantPast
    var dateCompleted: Date = Date.distantPast
    var status: Status.RawValue = Status.Active.rawValue
    var isComplete: Bool = false
    var itemTint: String
    var weekDays: String
    
    @Relationship(deleteRule: .cascade)
    var notes: [Note]?
    @Relationship(inverse: \Tag.items)
    var tags: [Tag]?

    init(
        timestamp: Date,
        title: String,
        summary: String,
        symbol: String,
        dateAdded: Date,
        dateStarted: Date = Date .distantPast,
        dateCompleted: Date = Date.distantPast,
        status: Status = .Active,
        isComplete: Bool,
        itemTint: String,
        weekDays: String,
        notes: [Note]? = nil,
        tags: [Tag]? = nil
    ) {
        self.timestamp = timestamp
        self.title = title
        self.summary = summary
        self.symbol = symbol
        self.dateAdded = dateAdded
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.status = status.rawValue
        self.isComplete = isComplete
        self.itemTint = itemTint
        self.weekDays = weekDays
        self.notes = notes
        self.tags = tags
    }
    
    var isRemainderOn: Bool = false
    var remainderIDs: [String] = []
    var completedDates: [Date] = []
    var inCompletedDates: [Date] = []
    var dateCreated: Date = Date()
    
    var icon: Image {
        switch Status(rawValue: status)! {
        case .Queue:
            Image(systemName: "pause.circle")
        case .Active:
            Image(systemName: "play.circle")
        case .Completed:
            Image(systemName: "stop.circle")
        }
    }
    var tintColor: Color {
        switch itemTint {
            case "TaskColor 1": return .taskColor1
            case "TaskColor 2": return .taskColor2
            case "TaskColor 3": return .taskColor3
            case "TaskColor 4": return .taskColor4
            case "TaskColor 5": return .taskColor5
            case "TaskColor 6": return .taskColor6
            case "TaskColor 7": return .taskColor7
            case "TaskColor 8": return .taskColor8
            case "TaskColor 9": return .taskColor9
            case "TaskColor 10": return .taskColor10
            case "TaskColor 11": return .taskColor11
            case "TaskColor 12": return .taskColor12
            case "TaskColor 13": return .taskColor13
            case "TaskColor 14": return .taskColor14
            case "TaskColor 15": return .taskColor15
            case "TaskColor 16": return .taskColor16
            case "TaskColor 17": return .taskColor17
            case "TaskColor 18": return .taskColor18
            case "TaskColor 19": return .taskColor19
            case "TaskColor 20": return .taskColor20
            case "TaskColor 21": return .taskColor21
            case "TaskColor 22": return .taskColor22
            case "TaskColor 23": return .taskColor23
            case "TaskColor 24": return .taskColor24
            case "TaskColor 25": return .taskColor25
            case "TaskColor 26": return .taskColor26
            case "TaskColor 27": return .taskColor27
            case "TaskColor 28": return .taskColor28
            case "TaskColor 29": return .taskColor29
            case "TaskColor 30": return .taskColor30
    
        default: return .black
        }
    }
    static func futureItemsPredicate() -> Predicate<Item> {
        let currentDate = Date()
        return #Predicate<Item> {
            return currentDate > $0.dateCreated ? true : false
        }
    }
}

enum Status: Int, Codable, Identifiable, CaseIterable {
    case Queue, Active, Completed
    var id: Self {
        self
    }
    var descr: LocalizedStringResource {
        switch self {
        case .Queue:
            "Queue"
        case .Active:
            "Active"
        case .Completed:
            "Completed"
        }
    }
}

