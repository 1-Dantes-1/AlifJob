//
//  ContentView.swift
//  AlifJob
//
//  Created by Buzurg Rakhımzoda on 8.04.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var tasks: TaskModel
    @AppStorage("curentUserJob") var curentUserJob: String = ""
    @State var isSheetActive: Bool = false
    var body: some View {
        NavigationStack{
            if curentUserJob != "Boss"{
                List{
                    ForEach(tasks.tasks){task in
                        TaskView(taskTitle: task.taskTitle, taskDescription: task.taskDescription, taskMark: task.taskMark, taskDueDate: task.taskDueDate)
                            .padding()
                    }
                }
                .listStyle(.sidebar)
                .navigationTitle("Tasks")
            }
            else {
                List{
                ForEach(tasks.tasks){task in
                    TaskView(taskTitle: task.taskTitle, taskDescription: task.taskDescription, taskMark: task.taskMark, taskDueDate: task.taskDueDate)
                        .padding()
                }
                .onDelete(perform: tasks.deleteTask)
            }
            .listStyle(.sidebar)
            .navigationTitle("Tasks")
            .toolbar{
                if curentUserJob == "Boss"{
                    ToolbarItem(placement: .navigation) {
                        EditButton()
                    }
                    ToolbarItem(placement: .primaryAction) {
                        Button(action:{
                            isSheetActive.toggle()
                        }){
                            Image(systemName: "plus")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .sheet(isPresented: $isSheetActive) {
                AddView()
            }
            }
        }
    }
    func isBoss() -> Bool{
        if curentUserJob == "Boss"{
            return true
        }
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TaskModel())
    }
}
