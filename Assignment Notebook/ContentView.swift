//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Student on 1/18/22.
//

import SwiftUI

struct ContentView: View {
    @State private var items = ["First Item", "Second Item", "Third Item", "Fourth Item", "Fifth Item"]
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { thing in
                    Text(item)
                }
                .onMove(perform: { indices, newOffset in
                    items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    items.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Items", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
