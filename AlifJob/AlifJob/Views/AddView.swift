//
//  AddView.swift
//  AlifJob
//
//  Created by Buzurg Rakhımzoda on 9.04.2023.
//

import SwiftUI

struct AddView: View {
    @AppStorage("taskController") var taskNumber = 0
    @Environment(\.dismiss) var dismiss
    let variationsOfMark = ["Critical" ,"Important" , "Additional"]
    let emploees = ["Arda" , "Buzurg"]
    @EnvironmentObject var tasks: TaskModel
    @EnvironmentObject var user: UserModel
    @State var alertTitle: String = ""
    @State var isAlertActive: Bool = false
    @State var taskEmployee: String = "Arda"
    @State var taskTitle: String = ""
    @State var taskDescription: String = ""
    @State var taskMark: String = "Critical"
    @State var taskDueDate: Date = Date.now
    @State var isTaskMarkCrit: Bool = false
    var body: some View {
        VStack{
            Text("New Task")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .fontWeight(.bold)
            Spacer()
                .frame(height: 100)
            TextField("Title", text: $taskTitle).padding()
                .frame(width: UIScreen.main.bounds.width - 100, height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
            TextField("Description", text: $taskDescription).padding()
                .frame(width: UIScreen.main.bounds.width - 100, height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
            HStack{
                Text("Select Significance: ")
                    .foregroundColor(.blue)
                Picker("Select Significance", selection: $taskMark) {
                    ForEach(variationsOfMark, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                .padding()
            }
            DatePicker(selection:$taskDueDate, in: Date.now...Date.distantFuture, displayedComponents: [.date, .hourAndMinute]){
                Text("Date")
                    .foregroundColor(.blue)
                    .padding(.leading, 50)
            }
            .padding(.trailing, 30)
            .padding()
            HStack {
                Text("Select emplyee to do task")
                    .foregroundColor(.blue)
                    .padding()
                Picker("Pick employee to do task", selection: $taskEmployee){
                    ForEach(user.getAllEmployees(), id: \.self){
                        Text($0)
                    }
                }
            }
            Button (action:saveButtonPressed){
                Text("+ Add Task")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .frame(width: UIScreen.main.bounds.width - 250, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .padding()
        }
        .alert(isPresented: $isAlertActive, content: getAlert)
    }
    func saveButtonPressed(){
        if isTextAproptiated(){
            tasks.addTask(title: taskTitle, description: taskDescription, mark: taskMark, dueDate: taskDueDate, number: taskNumber)
            dismiss()
        }
    }
    func isTextAproptiated() -> Bool {
        if taskTitle.count < 3 {
            alertTitle = "Title of your task should be more than 3 characters."
            isAlertActive.toggle()
            return false
        }
        if taskDescription.count < 5 {
            alertTitle = "Description of your task should be more than 5 characters."
            isAlertActive.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
            .environmentObject(UserModel())
            .environmentObject(TaskModel())
    }
}
