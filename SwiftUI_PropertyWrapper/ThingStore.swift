//
//  ThingStore.swift
//  SwiftUI_PropertyWrapper
//
//  Created by 장기화 on 2022/05/03.
//

import SwiftUI

final class ThingStore: ObservableObject {
    @Published var things: [Thing] = []
}

struct Thing: Identifiable {
    let id = UUID()
    let short: String
    let long: String
}
