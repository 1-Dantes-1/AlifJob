//
//  LogInPage.swift
//  AlifJob
//
//  Created by Buzurg Rakhımzoda on 8.04.2023.
//

import SwiftUI
import Firebase
struct LogInPageView: View {
    @EnvironmentObject var users: UserModel
    @AppStorage("LoggedIn") var loggedIn = false
    @State var user_email: String = ""
    @State var user_password: String = ""
    @State var alertMessage: String = ""
    @State var isAlertActive: Bool = false
    @State var isSheetActive: Bool = false
    
    var body: some View {
        VStack{
            Text("Log In")
                .font(.largeTitle)
                .foregroundColor(.blue)
            Spacer()
                .frame(height: 100)
            TextField("email@example.com", text: $user_email).padding()
                .frame(width: UIScreen.main.bounds.width - 100, height: 40)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $user_password).padding()
                .frame(width: UIScreen.main.bounds.width - 100, height: 40)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
            Spacer()
                .frame(height: 40)
            Button(action:{
                if isAppropriate(){
                    signIn()
                }
            }){
                Text("Log in")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .frame(width: UIScreen.main.bounds.width - 300, height: 40)
            .background(.blue)
            .cornerRadius(15)
            Spacer()
                .frame(height: 40)
            Text("Dont Have Account Yet? Sign Up")
                .foregroundColor(.gray)
                .onTapGesture {
                   isSheetActive = true
                }
        }
        .sheet(isPresented: $isSheetActive, content: {
           SignUpPageView()
        })
        .alert(isPresented: $isAlertActive) {
            Alert(title: Text(alertMessage), dismissButton: .cancel(Text("OK")))
        }
    }
    func signIn(){
        Auth.auth().signIn(withEmail: user_email, password: user_password){
            result, error in if error != nil{print(error?.localizedDescription)}
            loggedIn = true
        }
    }
    func register(){
        Auth.auth().createUser(withEmail: user_email, password: user_password){
            result, error in
            if error != nil {print(error?.localizedDescription)}
            loggedIn = true
        }
    }
    func isAppropriate() -> Bool{
        if user_email.isEmpty || user_password.isEmpty{
           alertMessage = "Fill all blanks"
            isAlertActive.toggle()
            return false
        }
        if users.userExist(userEmail: user_email, userPassword: user_password){
            
        }
        if !users.userExist(userEmail: user_email, userPassword: user_password){
            alertMessage = "No such user found"
            isAlertActive.toggle()
            return false
        }
       
        
        return true
    }
}

struct LogInPage_Previews: PreviewProvider {
    static var previews: some View {
        LogInPageView()
            .environmentObject(UserModel())
    }
}
