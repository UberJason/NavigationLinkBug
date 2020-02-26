//
//  ContentView.swift
//  NavigationLinkBug
//
//  Created by Jason Ji on 2/25/20.
//  Copyright © 2020 Jason Ji. All rights reserved.
//

import SwiftUI

struct Value: Identifiable {
    var id: Int
}

struct ContentView: View {
    @State var selected: Int? = nil
    let values = (0..<200).map { Value(id: $0) }

    var body: some View {
        NavigationView {
            List(values) { value in
                NavigationLink(destination: DetailView(value: value.id, selection: self.$selected), tag: value.id, selection: self.$selected) {
                    Text("Thing \(value.id)")
                }.frame(minWidth: 200, idealHeight: 30, alignment: .leading)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }.listStyle(myListStyle())
    }

    func myListStyle() -> some ListStyle {
        return SidebarListStyle()
    }
}

struct DetailView: View {
    var value: Int
    @Binding var selection: Int?

    var body: some View {
        VStack {
            VStack {
                Text("Selected \(value)").frame(maxWidth: .infinity, maxHeight: .infinity)
                Button(action: {
                    self.selection = 10
                }) {
                    Text("Tap to select 10")
                }

                Button(action: {
                    self.selection = 190
                }) {
                    Text("Tap to select 190")
                }
            }.padding()
        }.frame(width: 100, height: 100)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
