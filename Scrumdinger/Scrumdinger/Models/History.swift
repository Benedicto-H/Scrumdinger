//
//  History.swift
//  Scrumdinger
//
//  Created by 홍진표 on 2023/06/05.
//

import Foundation

struct History: Identifiable, Codable {
    
    // MARK: - Stored-Props
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    
    // MARK: - Init
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee]) {
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}
