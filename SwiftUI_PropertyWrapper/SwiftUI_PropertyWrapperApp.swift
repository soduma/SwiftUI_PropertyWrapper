//
//  SwiftUI_PropertyWrapperApp.swift
//  SwiftUI_PropertyWrapper
//
//  Created by 장기화 on 2022/05/03.
//

import SwiftUI

@main
struct SwiftUI_PropertyWrapperApp: App {
    @StateObject private var store = ThingStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
