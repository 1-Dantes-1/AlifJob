//
//  TaskModel.swift
//  Me_Myself
//
//  Created by Buzurg Rakhımzoda on 31.03.2023.
//

import SwiftUI

class TaskModel: ObservableObject {
    let tasksKey:String = "tasks_list"
    @AppStorage("taskController") var taskNumber = 0
    @AppStorage("curentUserJob") var curentUserJob: String = ""
    @Published var tasks: [Task] = []{
        didSet{
            saveTasks()
        }
    }
    init(){
        getTask()
    }

    func getTask(){
        guard
            let data = UserDefaults.standard.data(forKey:tasksKey),
            let savedTasks = try? JSONDecoder().decode([Task].self, from: data)
        else {return}
        
        self.tasks = savedTasks
    }
    func addTask(title: String, description: String, mark: String, dueDate: Date, number:Int){
        let newTask = Task(taskTitle: title, taskDescription: description, taskMark: mark, taskDueDate: dueDate, taskNumber: taskNumber)
        tasks.append(newTask)
        taskNumber += 1
    }
    func deleteTask(indexSet: IndexSet){
        if curentUserJob == "Boss"{
            tasks.remove(atOffsets: indexSet)
        }
    }
    func saveTasks(){
        if let encodedData = try? JSONEncoder().encode(tasks){
            UserDefaults.standard.set(encodedData, forKey:tasksKey)
        }
    }
    func changeTask(title:String, description: String, mark: String, dueDate: Date, number: Int){
        let newTask = Task(taskTitle: title, taskDescription: description, taskMark: mark, taskDueDate: dueDate,taskNumber: taskNumber)
        tasks.remove(at:taskNumber)
        tasks.insert(newTask, at: taskNumber)
    }
}
