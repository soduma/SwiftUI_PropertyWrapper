//
//  AddThingView.swift
//  SwiftUI_PropertyWrapper
//
//  Created by 장기화 on 2022/05/03.
//

import SwiftUI

struct AddThingView: View {
  @Environment(\.presentationMode) var presentationMode
    @ObservedObject var someThings: ThingStore
    @State private var thing = ""

  var body: some View {
    VStack {
        TextField("Thing I Learned", text: $thing)
            .textFieldStyle(.roundedBorder)
            .padding()
            .disableAutocorrection(true)
        
      Button("Done") {
          if !thing.isEmpty {
              someThings.things.append(thing)
          }
          presentationMode.wrappedValue.dismiss()
      }
      Spacer()
    }
    .textCase(nil)
  }
}

struct AddThingView_Previews: PreviewProvider {
  static var previews: some View {
      AddThingView(someThings: ThingStore())
  }
}

