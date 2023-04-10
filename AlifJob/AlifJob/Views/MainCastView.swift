//
//  MainCastView.swift
//  AlifJob
//
//  Created by Buzurg Rakhımzoda on 9.04.2023.
//

import SwiftUI
import Firebase

struct MainCastView: View {
    @EnvironmentObject var task: TaskModel
    @EnvironmentObject var user: UserModel
    var body: some View {
        TabView{
            ContentView()
                .environmentObject(TaskModel())
                .tabItem {
                    Image(systemName:"house")
            }
            AccountView()
                .environmentObject(UserModel())
                .tabItem {
                    Image(systemName: "person")
            }
        }
    }
}

struct MainCastView_Previews: PreviewProvider {
    static var previews: some View {
        MainCastView()
    }
}
