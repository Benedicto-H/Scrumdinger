//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by 홍진표 on 2023/06/08.
//

import Foundation

struct ErrorWrapper: Identifiable {
    
    // MARK: - Stored-Props
    let id: UUID
    let error: Error
    let guidance: String
    
    // MARK: - Init
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
