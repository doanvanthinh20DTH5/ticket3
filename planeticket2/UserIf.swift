//
//  UserIf.swift
//  planeticket2
//
//  Created by DoanThinh on 5/18/23.
//

import SwiftUI
import FirebaseFirestore
import Firebase
import FirebaseAuth

struct UserIf: View {
    @State private var user: User?
    @State private var signout = false
    @EnvironmentObject var authViewModel: AuthViewModel
       
       var body: some View {
           VStack {
               if let user = user {
                   Text(user.email)
               }
               
               Spacer()
               
               VStack {
                   Button(action: {
                       // Show user information
                   }) {
                       Text("Thông tin người dùng")
                           .foregroundColor(.green)
                   }
                   .padding()
                   .cornerRadius(10)
                   
                   Button(action: {
                      
                   }) {
                       Text("Đổi mật khẩu")
                           .foregroundColor(.green)
                   }
                   .padding()
                   .cornerRadius(10)
                   
                   Button(action: {
                       // Show purchased tickets view
                   }) {
                       Text("Vé đã mua")
                           .foregroundColor(.green)
                   }
                   .padding()
                   .cornerRadius(10)
               }
               .padding()
               
               Button(action: {
                   authViewModel.signOut()
               }) {
                   Text("Sign Out")
                       .foregroundColor(.white)
               }
               .padding()
               .background(Color.blue)
               .cornerRadius(10)
               
           }
           .padding()
           .onAppear {
               if let userEmail = Auth.auth().currentUser?.email {
                   let db = Firestore.firestore()
                   let userRef = db.collection("user").whereField("email", isEqualTo: userEmail)
                   
                   userRef.getDocuments { querySnapshot, error in
                       if let error = error {
                           print("Error getting user document: \(error)")
                           return
                       }
                       
                       guard let documents = querySnapshot?.documents else {
                           print("No user document found")
                           return
                       }
                       
                       // Assuming email is unique, retrieve the first document
                       let user = documents[0].data()
                       
                       do {
                           // Convert the Firestore data to your User model
                           let jsonData = try JSONSerialization.data(withJSONObject: user, options: [])
                           let decoder = JSONDecoder()
                           self.user = try decoder.decode(User.self, from: jsonData)
                       } catch {
                           print("Error decoding user data: \(error)")
                       }
                   }
               }
           }
       }
}

struct UserIf_Previews: PreviewProvider {
    static var previews: some View {
        UserIf()
    }
}


