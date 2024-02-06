//
//  User.swift
//  cookNow
//
//  Created by Awesomepia on 2/6/24.
//

import Foundation

final class User {
    let shared = User()
    
    var accessToken: String = ""
    var refreshToken: String = ""
}
