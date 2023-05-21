//
//  homePage.swift
//  planeticket2
//
//  Created by DoanThinh on 5/16/23.
//

import SwiftUI

struct homePage: View {
    @State private var search: String = ""
    @State private var showFind = false
    
    var body: some View {
        TabView {
            VStack {
                Text("Tìm kiếm vé máy bay tốt nhất")
                    .font(.title)
                    .padding()
                
                Button(action: {
                    showFind = true
                }) {
                    Text("Tìm kiếm")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showFind) {
                    viewFindPlane()
                }
                
                Spacer()
                
                Text("Phổ biến")
                    .font(.title)
                    .padding(.horizontal)
                
                Spacer()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Trang chủ")
            }
            
            Contact()
                .tabItem {
                    Image(systemName: "phone")
                    Text("Liên hệ")
                }
          
            UserIf()
                            .tabItem {
                    Image(systemName: "person")
                    Text("Tài khoản")
                }
           
        }
    }
}

struct homePage_Previews: PreviewProvider {
    static var previews: some View {
        homePage()
    }
}
