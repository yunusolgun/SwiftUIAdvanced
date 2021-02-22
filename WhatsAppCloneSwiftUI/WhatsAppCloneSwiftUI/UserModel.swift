//
//  UserModel.swift
//  WhatsAppCloneSwiftUI
//
//  Created by yunus olgun on 21.02.2021.
//

import Foundation

struct UserModel: Identifiable {
    var id: Int
    var name: String
    var uidFromFirebase: String
}
