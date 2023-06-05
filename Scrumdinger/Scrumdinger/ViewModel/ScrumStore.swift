//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by 홍진표 on 2023/06/05.
//

import SwiftUI

@MainActor
class ScrumStore: ObservableObject {
    
    // MARK: - Published-Prop
    @Published var scrums: [DailyScrum] = []
    
    // MARK: - Methods
    private static func fileURL() throws -> URL {
        
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("scrums.data")
    }
    
    func load() async throws -> Void {
        
        let task: Task<[DailyScrum], Error> = Task<[DailyScrum], Error> {
            
            let fileURL: URL = try Self.fileURL()
            
            guard let data: Data = try? Data(contentsOf: fileURL) else { return [] }
            
            let dailyScrums: [DailyScrum] = try JSONDecoder().decode([DailyScrum].self, from: data)
            
            return dailyScrums
        }
        
        let scrums: [DailyScrum] = try await task.value
        
        self.scrums = scrums
    }
    
    func save(scrums: [DailyScrum]) async throws -> Void {
        
        let task: Task = Task {
            
            let data: Data = try JSONEncoder().encode(scrums)
            let outfile: URL = try Self.fileURL()
            
            try data.write(to: outfile)
        }
        
        _ = try await task.value
    }
}
