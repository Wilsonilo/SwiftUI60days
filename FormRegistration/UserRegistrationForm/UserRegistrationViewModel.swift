//
//  UserRegistrationViewModel.swift
//  UserRegistrationForm
//
//  Created by Wilson Munoz on 14/12/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import Foundation
import Combine

class UserRegistrationViewModel:ObservableObject {
    
    
    //Input (this is when you start and when changes emit it to show it in UI)
    @Published var username = ""
    @Published var password = ""
    @Published var passwordConfirm = ""
    
    //Output (this streams the changes to @Subscribes based on changes (ObservableObject) and validation from our methods.
    @Published var isUsernameLengthValid = false
    @Published var isPasswordLengthValid = false
    @Published var isPasswordCapitalLetter = false
    @Published var isPasswordConfirmValid = false
    
    
    private var cancellableSet: Set<AnyCancellable> = []

    init(){
        
        
        // Proccess sink and assign for username
        $username.receive(on: RunLoop.main) //.receive is sink
        .map{ username in
            return username.count >= 4
        }
        .assign(to: \.isUsernameLengthValid, on: self)
        .store(in:&cancellableSet)
        
        // Proccess sink and assign for password
        $password.receive(on: RunLoop.main)
            .map{ password in
                return password.count >= 8
        }
        .assign(to:\.isPasswordLengthValid, on:self)
        .store(in:&cancellableSet)
        
        //Check capital letter on password.
        $password
        .receive(on: RunLoop.main)
        .map { password in
            let pattern = "[A-Z]"
            if let _ = password.range(of: pattern, options: .regularExpression) {
                return true
            } else {
                return false
            }
        }
        .assign(to: \.isPasswordCapitalLetter, on: self)
        .store(in: &cancellableSet)
        
        //Check passwords are the same
        Publishers.CombineLatest($password, $passwordConfirm).receive(on: RunLoop.main)
        .map { (password, passwordConfirm) in
                return !passwordConfirm.isEmpty && (password == passwordConfirm)
        }.assign(to: \.isPasswordConfirmValid, on: self)
        .store(in: &cancellableSet)
        
    }
    
}
