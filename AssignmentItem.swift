//
//  AssignmentItem.swift
//  Assignment Notebook
//
//  Created by Student on 4/22/22.
//

import Foundation

class ToDoList: ObservableObject {

    @Published var items = [ToDoItem(course: "High", description: "Take out trash", dueDate: Date()),
                            ToDoItem(course: "Medium", description: "Pick up clothes", dueDate: Date()),
                            ToDoItem(course: "Low", description: "Eat a donut", dueDate: Date())]
 }
