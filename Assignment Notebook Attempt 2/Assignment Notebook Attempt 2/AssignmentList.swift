//
//  AssignmentList.swift
//  Assignment Notebook Attempt 2
//
//  Created by Student on 5/11/22.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items = [Assignment(priority: "High", description: "Take out trash", dueDate: Date()),
                            Assignment(priority: "Medium", description: "Pick up clothes", dueDate: Date()),
                            Assignment(priority: "Low", description: "Eat a donut", dueDate: Date())]
 }
