//
//  AccountView.swift
//  AlifJob
//
//  Created by Buzurg Rakhımzoda on 9.04.2023.
//

import SwiftUI
import FirebaseAuth

struct AccountView: View {
    @EnvironmentObject var user: UserModel
    @AppStorage("curentUserName") var curentUserName: String = ""
    @AppStorage("curentUserSurname") var curentUserSurname: String = ""
    @AppStorage("curentUserJob") var curentUserJob: String = ""
    @AppStorage("curentUserEmail") var curentUserEmail: String = ""
    @AppStorage("curentUserPassword") var curentUserPassword: String = ""
    @AppStorage("LoggedIn") var loggedIn = true
    var body: some View {
        NavigationStack{
            VStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray.opacity(0.5))
                HStack{
                    Text("\(curentUserName) \(curentUserSurname)")
                        .font(.title2)
                        .foregroundColor(.brown)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text(curentUserJob)
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
                    .frame(height: 20)
                Button(action:{
                    loggedIn = false
                }){
                    Text("Switch to another Account")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                }
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(UserModel())
    }
}
