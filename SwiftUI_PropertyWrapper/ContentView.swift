//
//  ContentView.swift
//  SwiftUI_PropertyWrapper
//
//  Created by 장기화 on 2022/05/03.
//

import SwiftUI

final class ThingStore: ObservableObject {
  @Published var things: [String] = []
}

struct ContentView: View {
  @State private var showAddThing = false
  @StateObject private var myThings = ThingStore()

  var body: some View {
    NavigationView {
      VStack(spacing: 20) {
        if myThings.things.isEmpty {
          Text("Add acronyms you learn")
            .foregroundColor(.gray)
        }
        ForEach(myThings.things, id: \.self) { thing in
          Text(thing)
        }
        Spacer()
      }
      .sheet(isPresented: $showAddThing) {
        AddThingView(someThings: myThings)
      }
      .navigationTitle("TIL")
      .toolbar {
        ToolbarItem {
          // swiftlint:disable:next multiple_closures_with_trailing_closure
          Button(action: { showAddThing.toggle() }) {
            Image(systemName: "plus.circle")
                  .font(.body)
          }
        }
      }
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
