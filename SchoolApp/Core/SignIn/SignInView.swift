//
//  SignInView.swift
//  SchoolApp
//
//  Created by Esse Jacques  on 20/07/2024.
//

import SwiftUI

struct SignInView: View {
    @Binding var email : String ;
    @Binding var password : String ;
    var body: some View {
        NavigationStack{
            HStack{
                VStack (alignment: .leading){
                    Text("Login")
                        .font(.title)
                        .bold()
                        .padding(.vertical, 10)
                    Text("Please sign in to continue")
                }
                Spacer()
            }.padding(.horizontal)

            VStack{
                TextField("Email", text: $email)
                    .autocapitalization(.none )     
                    .padding()
                    .foregroundColor(.gray)
                    .background(Color(.systemGray6))
                    .cornerRadius(6.0)
                    .padding(.vertical, 5)


                SecureField("Password", text: $password)
                    .padding()
                    .foregroundColor(.gray)
                    .background(Color(.systemGray6))
                    .cornerRadius(6.0)
                    .padding(.vertical, 5)



            }.padding(.horizontal)

            Button {

            } label: {
                HStack {
                    Spacer()
                    Text("Login")
                        .font(.title3)
                        .bold()
                    Spacer()
                }

            }
            .padding()
            .foregroundColor(.white)
            .background(.black)
            .cornerRadius(3.0)
            .padding(.vertical, 10)
            .padding(.horizontal)
            .task {
                print("Hello School App")
            }

        }
    }
}

#Preview {
    SignInView(email: .constant(""), password: .constant(""))
}
