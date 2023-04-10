//
//  UserModel.swift
//  AlifJob
//
//  Created by Buzurg Rakhımzoda on 9.04.2023.
//

import SwiftUI

class UserModel: ObservableObject {
    let userKey:String = "userList"
    @AppStorage("curentUserName") var curentUserName: String = ""
    @AppStorage("curentUserSurname") var curentUserSurname: String = ""
    @AppStorage("curentUserJob") var curentUserJob: String = ""
    @AppStorage("curentUserEmail") var curentUserEmail: String = ""
    @AppStorage("curentUserPassword") var curentUserPassword: String = ""
    @Published var users: [User] = []{
        didSet{
            saveUsers()
        }
    }
    
    init(){
        getUsers()
    }
    
    func getUsers(){
        guard
            let data = UserDefaults.standard.data(forKey:userKey),
            let savedUser = try? JSONDecoder().decode([User].self, from: data)
        else {return}
        
        self.users = savedUser
    }
    
    func addUsers(name: String, surname:String, job:String, email: String, userPassword:String){
        let newUser = User(userName: name, userSurname: surname, userJob: job, userEmail: email, userPassword: userPassword)
        users.append(newUser)
    }
    
    func saveUsers(){
        if let encodedData = try? JSONEncoder().encode(users){
            UserDefaults.standard.set(encodedData, forKey: userKey)
        }
    }
    func userExist(userEmail:String, userPassword: String) -> Bool{
        for user in users {
            if user.userEmail == userEmail && user.userPassword == userPassword{
                curentUserName = user.userName
                curentUserJob = user.userJob
                curentUserEmail = user.userEmail
                curentUserSurname = user.userSurname
                curentUserPassword = user.userPassword
                return true
            }
        }
        return false
    }
    func getAllEmployees() -> [String]{
        var employees: [String] = []
        for user in users {
            if user.userJob == "Employee"{
                employees.append(user.userName)
            }
        }
        return employees
    }
}
