//
//  AddAssignmentView.swift
//  Assignment Notebook Attempt 2
//
//  Created by Student on 5/11/22.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var courseTitle = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let priorities = ["Math", "Engineering", "Mobile Apps", "Physics", "Civics", "Film"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Course Title", selection: $courseTitle) {
                    ForEach(Self.priorities, id: \.self) { courseTitle in
                        Text(courseTitle)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            } .navigationBarTitle("Add Assignment", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if courseTitle.count > 0 && description.count > 0 {
                    let item = Assignment(id: UUID(), courseTitle: courseTitle,
                                        description: description, dueDate: dueDate)
                    assignmentList.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                    
                }
                
            })
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}
