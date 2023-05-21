//
//  Payment.swift
//  planeticket2
//
//  Created by DoanThinh on 5/16/23.
//

import SwiftUI

struct Payment: View {
    @State private var phoneNumber = ""
        @State private var amount = ""
        
        var body: some View {
            VStack {
                Text("Thông tin thanh toán MOMO")
                    .font(.title)
                    .padding()
                
                TextField("Số điện thoại", text: $phoneNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Số tiền", text: $amount)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    makePayment()
                }) {
                    Text("Thanh toán")
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                
            }
            .padding()
        }
        
        func makePayment() {
            // Gửi yêu cầu thanh toán MOMO và xử lý kết quả
            // Lưu thông tin thanh toán vào Firestore
        }

}

struct Payment_Previews: PreviewProvider {
    static var previews: some View {
        Payment()
    }
}
