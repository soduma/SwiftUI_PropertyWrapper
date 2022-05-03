//
//  ThingView.swift
//  SwiftUI_PropertyWrapper
//
//  Created by 장기화 on 2022/05/03.
//

import SwiftUI

struct ThingView: View {
    @State private var showAddThing = false
    let thing: Thing
    
    var body: some View {
        VStack {
            Text(thing.short)
                .font(.largeTitle)
            Text(thing.long)
                .font(.title)
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showAddThing) {
            AddThingView()
        }
        .toolbar {
            ToolbarItem {
                Button {
                    showAddThing.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.body)
                }
            }
        }
    }
}

struct ThingView_Previews: PreviewProvider {
    static var previews: some View {
        ThingView(thing: Thing(short: "TIL", long: "Thing I Learned"))
    }
}
