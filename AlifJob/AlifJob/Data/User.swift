//
//  User.swift
//  AlifJob
//
//  Created by Buzurg Rakhımzoda on 9.04.2023.
//

import SwiftUI

struct User: Identifiable, Codable{
    var id = UUID()
    
    let userName: String
    let userSurname: String
    let userJob:String
    let userEmail:String
    let userPassword: String
}
