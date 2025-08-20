//
//  LoginView.swift
//  VernostTask
//
//  Created by Apple on 19/08/25.
//

import SwiftUI


struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.gray.opacity(0.2).ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                TextField("Enter Email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
                    .padding(.horizontal, 20)
                    .padding(.top, 40)
                
                SecureField("Enter Password", text: $viewModel.password)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
                    .padding(.horizontal, 20)
                
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.subheadline)
                        .padding(.top, 5)
                }
                loginButton
            }
            
            .padding(.top, 110)
        }
    }
    
    private var loginButton:some View{
        Button {
            viewModel.validateAndLogin {
                isLoggedIn = true
            }
        } label: {
            Text("Login")
                .fontWeight(.semibold)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 54)
                .background(Color.blue)
                .cornerRadius(10)
                .padding()
                .padding(.top, 10)
        }
        
    }
}




#Preview {
    LoginView(isLoggedIn: .constant(false))
}
