//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by 홍진표 on 2023/06/01.
//

import Foundation

struct DailyScrum: Identifiable, Codable {
    
    // MARK: - Stored-Props
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    var history: [History] = []
    
    // MARK: - Computed-Prop
    var lengthInMinutesAsDouble: Double {
        
        get {
            return Double(lengthInMinutes)
        }
        
        set(newValue) {
            return lengthInMinutes = Int(newValue)
        }
    }
    
    // MARK: - Init
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map({ Attendee(name: $0) })
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    
    struct Attendee: Identifiable, Codable {
        
        // MARK: - Stored-Props
        let id: UUID
        var name: String
        
        // MARK: - Init
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    // MARK: - Computed-Prop (-> Singleton Instance)
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}

extension DailyScrum {
    
    // MARK: - Computed-Prop (-> Singleton Instance)
    static var sampleData: [DailyScrum] {
        [
            DailyScrum(title: "Design",
                       attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                       lengthInMinutes: 10,
                       theme: .yellow),
            DailyScrum(title: "App Dev",
                       attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                       lengthInMinutes: 5,
                       theme: .orange),
            DailyScrum(title: "Web Dev",
                       attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                       lengthInMinutes: 5,
                       theme: .poppy)
        ]
    }
}
