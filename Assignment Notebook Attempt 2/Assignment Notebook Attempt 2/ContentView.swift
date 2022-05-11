//
//  ContentView.swift
//  Assignment Notebook Attempt 2
//
//  Created by Student on 5/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var assignments =
        
        [Assignment(priority: "High", description: "Take out trash", dueDate: Date()),
         
         Assignment(priority: "Medium", description: "Pick up clothes", dueDate: Date()),
         
         Assignment(priority: "Low", description: "Eat a donut", dueDate: Date())]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(assignments) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.priority)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    assignments.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignments.remove(atOffsets: indexSet)
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

struct Assignment: Identifiable {
    var id = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
}


