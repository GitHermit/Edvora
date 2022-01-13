//
//  LoginView.swift
//  Edvora
//  LoginView layout
//  Created by Chase Sanchez on 1/12/22.
//

import SwiftUI

struct LoginView: View {
    
    //handles if eye icon has been clicked on password field
    @State private var isPasswordVisible = false
    
    @State private var username = ""
    @State private var isEnteringUsername = false
    
    @State private var password = ""
    @State private var isEnteringPassword = false
    
    @State private var email = ""
    @State private var isEnteringEmail = false
    
    var primaryColor = Color("primaryColor")
    
    //Changes the color of username textfield based on interaction
    var usernameColor : Color {
        return isEnteringUsername ? Color("primaryColor") : .gray
    }
    
    //Changes the color of password textfield based on interaction
    var passwordColor : Color {
        return isEnteringPassword ? Color("primaryColor") : .gray
    }
    
    //Changes the color of email textfield based on interaction
    var emailColor : Color {
        return isEnteringEmail ? Color("primaryColor") : .gray
    }
    
    var body: some View {
        VStack {

            Image("edvoraLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 200.0,height: 100.0)
            
            
            //Username field and relevant icon
            ZStack {
                Text("Username")
                    .padding(EdgeInsets(top: 0, leading: 5,bottom: 0, trailing: 5))
                    .background(Color.white)
                    .offset(y: -15)
                    .frame(width: UIScreen.main.bounds.width - 100, alignment: .leading)
                    .zIndex(1)
            
                HStack(spacing: 15){
                    
                    Image(systemName: "person.fill")
                        .foregroundColor(Color.gray.opacity(0.8))
                    
                    //username field
                    TextField("", text: self.$username)
                    //simple way to track the active TextField
                        .onTapGesture {
                            isEnteringUsername = true
                            isEnteringEmail = false
                            isEnteringPassword = false
                        }
                }
                .autocapitalization(.none)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).stroke(self.usernameColor, lineWidth: 2))
                .padding(.top, 25)
            .frame(width: UIScreen.main.bounds.width - 60)
            }
            
            //Password field and relevant icons
            ZStack {
                Text("Password")
                    .padding(EdgeInsets(top: 0, leading: 5,bottom: 0, trailing: 5))
                    .background(Color.white)
                    .offset(y: -15)
                    .frame(width: UIScreen.main.bounds.width - 100, alignment: .leading)
                    .zIndex(1)
                
                HStack(spacing: 15){
                    
                    Image(systemName: "key.fill")
                        .foregroundColor(Color.gray.opacity(0.8))
                    
                    // password field
                    VStack {
                        if self.isPasswordVisible {
                            TextField("", text: self.$password)
                        }
                        else {
                            SecureField("", text: self.$password)
                        }
                    }
                    //simple way to track the active TextField
                    .onTapGesture {
                            isEnteringUsername = false
                            isEnteringEmail = false
                            isEnteringPassword = true
                        }
                    
                    //eye icon that controls whether text is visible
                    Button(action: {
                        self.isPasswordVisible.toggle()
                    }) {
                        Image(systemName: self.isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(self.primaryColor.opacity(0.8))
                    }
                }
                .autocapitalization(.none)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).stroke(self.passwordColor, lineWidth: 2))
                .padding(.top, 25)
            .frame(width: UIScreen.main.bounds.width - 60)
            }
            
            //Username field and relevant icon
            ZStack {
                Text("Email")
                    .padding(EdgeInsets(top: 0, leading: 5,bottom: 0, trailing: 5))
                    .background(Color.white)
                    .offset(y: -15)
                    .frame(width: UIScreen.main.bounds.width - 100, alignment: .leading)
                    .zIndex(1)
                
                HStack(spacing: 15){
                    
                    Image(systemName: "at")
                        .foregroundColor(Color.gray.opacity(0.8))
                    
                    // password field
                    TextField("", text: self.$email)
                    //simple way to track the active TextField
                        .onTapGesture {
                            isEnteringUsername = false
                            isEnteringEmail = true
                            isEnteringPassword = false
                        }
                }
                .autocapitalization(.none)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).stroke(self.emailColor, lineWidth: 2))
                .padding(.top, 25)
            .frame(width: UIScreen.main.bounds.width - 60)
            }
            

            //Forgot password
            HStack {
                
                Spacer()
                
                Button(action: {
//                    //TODO: Add password recovery
                }) {
                    Text("Forgot password?")
                        .foregroundColor(self.primaryColor.opacity(0.8))
                }
            }
            .frame(width: UIScreen.main.bounds.width - 60)
            .padding(.top, 10)
            
            //Login Button
            Button(action: {
                //TODO: Add login functionality
            }) {
                Text("LOGIN")
                    .foregroundColor(Color.white)
                    .padding(.vertical)
                    
            }
            .frame(width: UIScreen.main.bounds.width - 60)
            .background(Color("primaryColor"))
            .cornerRadius(15)
            .padding(.top, 25)
            
            //Sign up message
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(Color.gray)
                Button(action: {
                    //TODO: Add Sign up functionality
                }) {
                Text("Sign up")
                        .foregroundColor(primaryColor.opacity(0.8))
                }
            }
            .padding(.top, 15)
            .navigationBarHidden(false)
            }
                
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
