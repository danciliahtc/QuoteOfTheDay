//
//  QuoteModel.swift
//  QuoteOfTheDay
//
//  Created by Dancilia Harmon   on 2/10/25.
//  Quote Model represents a Quote object with properties for quoteText and quoteAuthor

import SwiftUI

struct Quote: Decodable {
    var quoteText: String
    var quoteAuthor: String?
    
}

// the model is Decodable so it can be directly parsed from the JSON response from the API
