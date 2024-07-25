//
//  ProfileView.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 25/07/24.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("firstName") private var firstName: String = ""
    @AppStorage("lastName") private var lastName: String = ""
    @AppStorage("email") private var email: String = ""
    var body: some View {
        if !firstName.isEmpty && !email.isEmpty {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Profile")
                            .font(.largeTitle)
                            .foregroundColor(Color("Ijo"))
                            .bold()
                        
                        HStack {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(Color("Ijo"))
                            
                            VStack(alignment: .leading) {
                                Text("\(firstName) \(lastName)")
                                    .font(.title2)
                                    .bold()
                                
                                Text(" \(email)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                // Action for navigation
                            }) {
                                Image(systemName: "arrow.right.circle")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(Color("Ijo"))
                            }
                        }
                    }
                    .padding()
                    
                    Spacer()
                }
                
                Form {
                    Section(header: Text("Account Settings").foregroundColor(.gray)) {
                        NavigationLink(destination: Text("Linked Accounts View")) {
                            HStack {
                                Text("Linked Accounts")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        NavigationLink(destination: Text("Change Password View")) {
                            HStack {
                                Text("Change Password")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        HStack {
                            Text("Add Account Number")
                            Spacer()
                            Image(systemName: "plus.circle")
                                .foregroundColor(.gray)
                        }
                        
                        Toggle(isOn: .constant(true)) {
                            Text("Push Notifications")
                        }
                        .toggleStyle(SwitchToggleStyle(tint: Color("Ijo")))
                        
                        Toggle(isOn: .constant(false)) {
                            Text("Dark Mode")
                        }
                        .toggleStyle(SwitchToggleStyle(tint: Color("Ijo")))
                    }
                    
                    Section(header: Text("More").foregroundColor(.gray)) {
                        NavigationLink(destination: Text("About Us View")) {
                            HStack {
                                Text("About Us")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        NavigationLink(destination: Text("Privacy Policy View")) {
                            HStack {
                                Text("Privacy Policy")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        NavigationLink(destination: Text("Terms and Conditions View")) {
                            HStack {
                                Text("Terms and Conditions")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .background(Color("LightGray"))
            }
//            .background(Color("DarkGray").ignoresSafeArea())
        }
        else{
            SignInWithAppleView()
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
