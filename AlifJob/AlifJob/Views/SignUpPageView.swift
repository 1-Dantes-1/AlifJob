//
//  SignUpPageView.swift
//  AlifJob
//
//  Created by Buzurg Rakhımzoda on 9.04.2023.
//

import SwiftUI

struct SignUpPageView: View {
    let jobVar = ["Boss", "Employee"]
    @EnvironmentObject var user: UserModel
    @Environment(\.dismiss) var dismiss
    @State var userName: String = ""
    @State var userSurname: String = ""
    @State var userJob: String = ""
    @State var userEmail: String = ""
    @State var userPassword: String = ""
    @State var repPass: String = ""
    @State var alertMessage: String = ""
    @State var isAlertActive: Bool = false
    
    var body: some View {
        VStack{
            Text("Sign Up")
                .foregroundColor(.blue)
                .font(.largeTitle)
            Spacer()
                .frame(height: 90)
            TextField("Name", text: $userName).padding()
                .frame(width: UIScreen.main.bounds.width - 100, height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            TextField("Surname", text: $userSurname).padding()
                .frame(width: UIScreen.main.bounds.width - 100, height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            TextField("Email", text: $userEmail).padding()
                .keyboardType(.emailAddress)
                .frame(width: UIScreen.main.bounds.width - 100, height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $userPassword).padding()
                .frame(width: UIScreen.main.bounds.width - 100, height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
            SecureField("Repeat Password", text: $repPass).padding()
                .frame(width: UIScreen.main.bounds.width - 100, height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
            
            Picker("", selection: $userJob) {
                ForEach(jobVar, id: \.self){
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 300)
            .padding()
            
            Spacer()
                .frame(height: 90)
            
            Button(action:{
                if isAppropriate() {
                    user.addUsers(name: userName, surname: userSurname, job: userJob, email: userEmail, userPassword: userPassword)
                    dismiss()
                }
            }){
                Text("Confirm")
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 200, height: 40)
                    .background(Color.blue)
                    .cornerRadius(15)
            }
        }
        .alert(isPresented: $isAlertActive) {
            Alert(title: Text(alertMessage), message: .none, dismissButton: .cancel(Text("OK")))
        }
    }
    func isAppropriate() -> Bool {
        if userName.isEmpty || userSurname.isEmpty || userEmail.isEmpty || userPassword.isEmpty || repPass.isEmpty || userJob.isEmpty{
            alertMessage = "Please fill all blanks."
            isAlertActive.toggle()
            return false
        }
        if userPassword != repPass {
            alertMessage = "Passwords do not match."
            isAlertActive.toggle()
            return false
        }
        if userName.count < 3 || userSurname.count < 3 || userEmail.count < 3 || userPassword.count < 3 || repPass.count < 3{
            alertMessage = "Blanks should have more than 3 characters."
            isAlertActive.toggle()
            return false
        }
        if !userEmail.contains("@"){
            alertMessage = "Please fill email field correctly."
            isAlertActive.toggle()
            return false
        }
        return true
    }
}

struct SignUpPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPageView()
    }
}
