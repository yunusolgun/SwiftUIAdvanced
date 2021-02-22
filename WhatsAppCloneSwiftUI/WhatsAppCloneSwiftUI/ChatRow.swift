//
//  ChatRow.swift
//  WhatsAppCloneSwiftUI
//
//  Created by yunus olgun on 22.02.2021.
//

import SwiftUI
import FirebaseAuth

struct ChatRow: View {
    var chatMessage: ChatModel
    var userToChatFromChatView: UserModel
    
    var body: some View {
        Group {
            
            if chatMessage.messageFrom == Auth.auth().currentUser!.uid && chatMessage.messageTo == userToChatFromChatView.uidFromFirebase {
                
                HStack {
                    Text(chatMessage.message).bold().foregroundColor(.black).padding()
                    Spacer()
                }
                
                
                
            } else if chatMessage.messageFrom == userToChatFromChatView.uidFromFirebase && chatMessage.messageTo == Auth.auth().currentUser!.uid {
                
                HStack {
                    Spacer()
                    
                    Text(chatMessage.message).bold().foregroundColor(.black).padding()
                }
                
            } else {
                //Nothing to show
            }
            
        }
        
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chatMessage: ChatModel(id: 0, message: "Message", uidFromFirebase: "bb", messageFrom: "dfdf", messageTo: "aa", messageDate: Date(), messageFromMe: true), userToChatFromChatView: UserModel(id: 1, name: "James", uidFromFirebase: "sdfsdf"))
    }
}
