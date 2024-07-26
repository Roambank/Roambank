//
//  SignInWithAppleView.swift
//  Roambank
//
//  Created by Eldenabih Tavirazin Lutvie on 25/07/24.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Text("Anda belom signin kocak 🥰👮🏿‍♀️🫃🏿")
            Spacer()
            SignInWithAppleButton(
                .signIn,
                onRequest: { request in
                    request.requestedScopes = [.fullName, .email]
                },
                onCompletion: { result in
                    switch result {
                    case .success(let authResults):
                        switch authResults.credential {
                        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                            _ = appleIDCredential.user
                            let userFirstName = appleIDCredential.fullName?.givenName
                            let userLastName = appleIDCredential.fullName?.familyName
                            let userEmail = appleIDCredential.email
                            
                            // Store the user data in AppStorage
                            if let firstName = userFirstName, let lastName = userLastName, let email = userEmail {
                                UserDefaults.standard.set(firstName, forKey: "firstName")
                                UserDefaults.standard.set(lastName, forKey: "lastName")
                                UserDefaults.standard.set(email, forKey: "email")
                            }
                        default:
                            break
                        }
                    case .failure(let error):
                        print("Authorization failed: \(error.localizedDescription)")
                    }
                }
            )
            .signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
            .frame(height: 45)
            .padding()
            Spacer()
        }
    }
}

struct SignInWithAppleView_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithAppleView()
    }
}
