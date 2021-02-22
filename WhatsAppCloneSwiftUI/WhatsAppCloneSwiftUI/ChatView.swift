//
//  ChatView.swift
//  WhatsAppCloneSwiftUI
//
//  Created by yunus olgun on 21.02.2021.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth

struct ChatView: View {
    var userToChat : UserModel
    @State var messageToSend = ""
    
    @ObservedObject var chatStore = ChatStore()
    
    let db = Firestore.firestore()
    
    var body: some View {
        VStack {
            
            ScrollView {
                ForEach(chatStore.chatArray) { chats in
                    ChatRow(chatMessage: chats, userToChatFromChatView: self.userToChat)
                }
            }
            
            
            
            HStack {
                TextField("Message here...", text: $messageToSend).frame(minHeight:30).padding()
                Button(action: {sendMessageToFirebase()}, label: {
                    Text("Send")
                }).frame(minHeight:50).padding()
            }
        }
    }
    
    func sendMessageToFirebase() {
        var ref: DocumentReference? = nil
        
        let myChatDictionary : [String:Any] = ["chatUserFrom": Auth.auth().currentUser!.uid, "chatUserTo":userToChat.uidFromFirebase, "date": generateDate(), "message": self.messageToSend ]
        
        ref = self.db.collection("Chats").addDocument(data: myChatDictionary, completion: { (error) in
            if error != nil {
                
            } else {
                self.messageToSend = ""
            }
        })
    }
    
    func generateDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy_MM_dd_hh_mm_ss"
        return (formatter.string(from: Date()) as NSString) as String
    }
    
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(userToChat: UserModel(id: 0, name: "James", uidFromFirebase: "23234251"))
    }
}
