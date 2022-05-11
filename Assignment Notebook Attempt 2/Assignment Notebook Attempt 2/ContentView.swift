//
//  ContentView.swift
//  Assignment Notebook Attempt 2
//
//  Created by Student on 5/11/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentList.items) { item in
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
                    (assignmentList.items).move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    (assignmentList.items).remove(atOffsets: indexSet)
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


