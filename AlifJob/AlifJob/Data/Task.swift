//
//  Task.swift
//  AlifJob
//
//  Created by Buzurg Rakhımzoda on 9.04.2023.
//

import Foundation

struct Task: Identifiable, Codable{
    var id = UUID()
    
    let taskTitle: String
    let taskDescription: String
    let taskMark: String
    let taskDueDate: Date
    let taskNumber: Int
    

    init(taskTitle: String, taskDescription: String, taskMark: String, taskDueDate: Date, taskNumber:Int) {
        self.taskTitle = taskTitle
        self.taskDescription = taskDescription
        self.taskMark = taskMark
        self.taskDueDate = taskDueDate
        self.taskNumber = taskNumber
    }
}
