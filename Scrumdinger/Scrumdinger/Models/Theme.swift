//
//  Theme.swift
//  Scrumdinger
//
//  Created by 홍진표 on 2023/06/01.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
    
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    // MARK: - Computed-Props
    var accentColor: Color {
        
        get {
            switch self {
            case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow:
                
                return .black
                
            case .indigo, .magenta, .navy, .oxblood, .purple:
                
                return .white
            }
        }
    }
    
    var mainColor: Color {
        
        get {
            return Color(rawValue)
        }
    }
    
    var name: String {
        
        get {
            return rawValue.capitalized
        }
    }
    
    var id: String {
        
        get {
            return name
        }
    }
}
