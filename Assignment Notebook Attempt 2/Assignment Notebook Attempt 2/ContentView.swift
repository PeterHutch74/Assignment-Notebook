//
//  ContentView.swift
//  Assignment Notebook Attempt 2
//
//  Created by Student on 5/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var courses = ["First", "Second ", "Third", "Fourth", "Fifth"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(courses, id: \.self) { course in
                    Text(course)
                }
                .onMove(perform: { indices, newOffset in
                    courses.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    courses.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Assignments", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
