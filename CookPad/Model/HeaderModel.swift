//
//  HeaderModel.swift
//  CookPad
//
//  Created by Kamalesh Kumar on 26/02/24.
//

import Foundation
// MARK: - Header Model

struct Header: Identifiable {
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
}
