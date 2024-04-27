//
//  Quote.swift
//  BB Quotes
//
//  Created by Apple on 20/04/24.
//

import Foundation

struct Quote: Decodable {
    let quote: String
    let character: String
    let production: String
}
