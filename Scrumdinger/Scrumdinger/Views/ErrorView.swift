//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by 홍진표 on 2023/06/08.
//

import SwiftUI

struct ErrorView: View {
    
    // MARK: - Environment-Prop
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Stored-Prop
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occurred!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    
    enum SampleError: Error {
        case errorRequired
    }
    
    static var wrapper: ErrorWrapper {
        
        get {
            return ErrorWrapper(error: SampleError.errorRequired, guidance: "You can safely ignore this error.")
        }
    }
    
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
