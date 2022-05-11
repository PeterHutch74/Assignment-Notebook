//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Student on 1/18/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var toDoList = ToDoList()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(toDoList) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    toDoList.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    toDoList.remove(atOffsets: indexSet)
                })
            }
        }
        .navigationBarTitle("Assignment List", displayMode: .inline)
        .navigationBarItems(leading: EditButton())
    }
}

struct ContentView_Previews: PreviewProvider {
    struct ToDoItem: Identifiable {
        var id = UUID()
        var course = String()
        var description = String()
        var dueDate = Date()
    }
    static var previews: some View {
        ContentView()
    }
}
