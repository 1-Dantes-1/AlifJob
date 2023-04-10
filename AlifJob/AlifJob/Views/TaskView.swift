//
//  TaskView.swift
//  AlifJob
//
//  Created by Buzurg Rakhımzoda on 9.04.2023.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var tasks: TaskModel
    @AppStorage("curentUserJob") var curentUserJob: String = ""
    @State var taskTitle: String = "Title"
    @State var taskDescription: String = "Lorem ipsum may be used as a placeholder before final copy is available. "
    @State var taskMark: String = "Important"
    @State var taskDueDate: Date = Date.now
    @State var isSheetActive: Bool = false
    @State var taskEmployer: String = "Arda"
    @State var systemIm: String = "circle"
    @State var isSettingsSheetActive: Bool = false
    var body: some View {
        HStack{
            Image(systemName: systemIm)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)
                .onTapGesture {
                    if systemIm == "circle"{
                        systemIm = "checkmark.circle"
                    }
                    else{systemIm = "circle"}
                }
            ZStack{
                Button(action:{
                    isSheetActive.toggle()
                }){
                    Text(taskTitle)
                        .foregroundColor(checkTaskMarkCrit() ? .white : .black)
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width - 100, height: 50)
                        .background(checkTaskMarkCrit() ? Color.red.opacity(0.5) : Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .shadow(color: Color.red.opacity(0.8), radius:10, x: 10, y: 10)
                }
                if curentUserJob == "Boss"{
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                        .padding(.leading, 250)
                        .onTapGesture {
                            isSettingsSheetActive.toggle()
                        }
                }
            }
        }
        .sheet(isPresented: $isSheetActive) {
            VStack{
                Text(taskTitle)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                    .frame(height: 90)
                    
                Text(taskDescription)
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                    .frame(height: 90)
                Text(taskMark)
                    .foregroundColor(checkTaskMarkCrit() ? .red : .blue)
                    .padding()
                Text("\(taskDueDate)")
                    .padding()
                Text("Employee to do \(taskEmployer)")
                    .foregroundColor(.blue)
                    .padding()
            }
        }
        .sheet(isPresented: $isSettingsSheetActive) {
            AddView(taskEmployee: taskEmployer, taskTitle: taskTitle, taskDescription: taskDescription, taskMark: taskMark, taskDueDate: taskDueDate)
        }
    }
    func checkTaskMarkCrit() -> Bool{
        if taskMark == "Critical"{
            return true
        }
        return false
    }
    
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(TaskModel())
            .previewLayout(.sizeThatFits)
    }
}
