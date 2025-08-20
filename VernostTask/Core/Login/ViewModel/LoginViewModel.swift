//
//  LoginViewModel.swift
//  VernostTask
//
//  Created by Apple on 19/08/25.
//


import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    
    func validateAndLogin(onSuccess: () -> Void) {
        errorMessage = nil
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let isValidEmail = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            .evaluate(with: email)
        
        guard isValidEmail else {
            errorMessage = "Please enter a valid email address"
            return
        }
        
        guard !password.isEmpty else {
            errorMessage = "Password cannot be empty"
            return
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters"
            return
        }
        
        onSuccess()
    }
}
