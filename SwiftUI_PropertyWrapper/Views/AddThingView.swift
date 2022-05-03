//
//  AddThingView.swift
//  SwiftUI_PropertyWrapper
//
//  Created by 장기화 on 2022/05/03.
//

import SwiftUI

struct AddThingView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var someThings: ThingStore
    @State private var short = ""
    @State private var long = ""
    
    private func saveAndExit() {
        if !short.isEmpty {
            someThings.things.append(Thing(short: short, long: long))
        }
        presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        VStack {
            TextField("TIL", text: $short)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.characters)
            TextField("Things I Learned", text: $long)
                .textInputAutocapitalization(.words)
                .onSubmit {
                    saveAndExit()
                }
            
            Button("Done") {
                saveAndExit()
            }
            .padding(.top, 16)
            Spacer()
        }
        .padding()
        .textFieldStyle(.roundedBorder)
    }
}

struct AddThingView_Previews: PreviewProvider {
    static var previews: some View {
        AddThingView()
            .environmentObject(ThingStore())
    }
}

