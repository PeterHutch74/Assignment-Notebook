//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Student on 1/18/22.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems = [AssignmentItem(subject: "Math", assignment: "Page 1-4", dueDate: Date()), AssignmentItem(subject: "English", assignment: "Essay", dueDate: Date()), AssignmentItem(subject: "Science", assignment: "Lab Write Up", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItems) { item in
                    Text(item.assignment
                    )
                }
                .onMove(perform: { indices, newOffset in
                    assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentItems.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Assignment Notebok", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable, Codable
{
    var id = UUID()
    var subject = String()
    var assignment = String()
    var dueDate = Date()
}
