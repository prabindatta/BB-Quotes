//
//  ViewModel.swift
//  BB Quotes
//
//  Created by Apple on 20/04/24.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    enum Status {
        case notStarted
        case fetching
        case success(date: (quote: Quote, character: Character))
        case failed(error: Error)
    }
    
    @Published private(set) var status: Status = .notStarted

    private let controller: FetchController
    
    init(controller: FetchController) {
        self.controller = controller
    }
    
    func getData(for show: String) async {
        status = .fetching
        
        do {
            let quote = try await self.controller.fetchQuote(from: show)
            
            let character = try await self.controller.fetchCharacter(quote.character)
            
            status = .success(date: (quote, character))
        } catch {
            status = .failed(error: error)
        }
    }
}
