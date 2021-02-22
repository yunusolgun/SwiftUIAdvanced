//
//  ContentView.swift
//  WhatsAppCloneSwiftUI
//
//  Created by yunus olgun on 21.02.2021.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct AuthView: View {
    
    let db = Firestore.firestore()
    @ObservedObject var userStore = UserStore()
    
    @State var useremail = ""
    @State var password = ""
    @State var username = ""
    @State var showAuthView = true
    
    var body: some View {
        
        NavigationView {
            
            if showAuthView {
                List {
                    Text("WhatsApp Clone").font(.largeTitle).bold()
                    
                    Section {
                        VStack(alignment: .leading) {
                            SectionSubTitle(subtitle: "User Email")
                            TextField("",text: $useremail)
                            
                        }
                    }
                    
                    Section {
                        VStack(alignment: .leading) {
                            SectionSubTitle(subtitle: "Password")
                            TextField("",text: $password)
                        }
                    }
                    
                    Section {
                        VStack(alignment: .leading) {
                            SectionSubTitle(subtitle: "Username")
                            TextField("",text: $username)
                        }
                    }
                    
                    Section {
                        HStack {
                            Spacer()
                            Button(action: {
                                // sign in
                                
                                Auth.auth().signIn(withEmail: self.useremail, password: self.password) { (result, error) in
                                    if error != nil {
                                        print(error?.localizedDescription)
                                    } else {
                                        // User signed in
                                        self.showAuthView = false
                                    }
                                }
                                
                            }, label: {
                                Text("Sign In")
                            })
                            Spacer()
                        }

                    }
                    
                    Section {
                        HStack {
                            Spacer()
                            Button(action: {
                                Auth.auth().createUser(withEmail: useremail, password: password) { (result, error) in
                                    if error != nil {
                                        print(error?.localizedDescription)
                                    } else {
                                        
                                        let myUserDictionary: [String: Any] = ["username": self.username, "useremail": self.useremail,"useruidfromfirebase":result!.user.uid]
                                        
                                        var ref: DocumentReference? = nil
                                        ref = self.db.collection("Users").addDocument(data: myUserDictionary, completion: { (error) in
                                            if error != nil {
                                                
                                            }
                                        })
                                        
                                        //User View
                                        self.showAuthView = false
                                        
                                    }
                                }
                                
                            }, label: {
                                Text("Sign Up")
                            })
                            Spacer()
                        }

                    }
                    
                    
                    
                }
            }  // AUTH VIEW END
            else {
                
                //USER VIEW
                
                NavigationView {
                    List(userStore.userArray) { user in
                        NavigationLink(
                            destination: ChatView(userToChat: user),
                            label: {
                                Text(String(user.name))
                            })
                        
                    }
                }.navigationBarTitle(Text("Chat with users"))
                .navigationBarItems(leading: Button(action: {
                    //code
                    do {
                        try Auth.auth().signOut()
                        self.showAuthView = true
                    } catch {
                        
                    }
                    
                }, label: {
                    Text("Log Out")
                }))
                
                
            }
            
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuthView(showAuthView:false)
            AuthView()
        }
        
    }
}

struct SectionSubTitle: View {
    var subtitle: String
    
    var body: some View {
        Text(subtitle).font(.subheadline).foregroundColor(.gray)
    }
}
