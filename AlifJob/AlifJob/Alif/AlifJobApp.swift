//
//  AlifJobApp.swift
//  AlifJob
//
//  Created by Buzurg Rakhımzoda on 8.04.2023.
//

import SwiftUI
import Firebase
@main
struct AlifJobApp: App {
    @AppStorage("LoggedIn") var loggedIn = false
    @EnvironmentObject var tasks: TaskModel
    @EnvironmentObject var users: UserModel
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            if loggedIn{
                MainCastView()
                    .environmentObject(UserModel())
                    .environmentObject(TaskModel())
            }
            else{
                LogInPageView()
                    .environmentObject(UserModel())
            }
        }
    }
}
