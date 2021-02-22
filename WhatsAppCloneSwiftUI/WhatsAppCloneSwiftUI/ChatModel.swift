//
//  ChatModel.swift
//  WhatsAppCloneSwiftUI
//
//  Created by yunus olgun on 22.02.2021.
//

import SwiftUI

struct ChatModel: Identifiable {
    var id: Int
    var message: String
    var uidFromFirebase: String
    var messageFrom: String
    var messageTo: String
    var messageDate: Date
    var messageFromMe: Bool
    
}
