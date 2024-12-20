//
//  ContentView.swift
//  Bank Application
//
//  Created by Florian Rath on 20.12.24.
//

import SwiftUI

struct LoginView: View {
    @State private var showAlert = false
    @State private var showInfoAlert = false
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        VStack {
            // Login background, info button and Raiffeisen logo
            ZStack {
                // Login background image
                Image("login_background")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(.all, edges: .top)
                
                // VStack to control vertical alignment
                VStack {
                    // Info button at the top
                    HStack {
                        Spacer()
                        Button(action: {
                            showInfoAlert = true
                        }) {
                            Image(systemName: "info.circle")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                        }
                        .padding(.trailing, 20)
                    }
                    
                    Spacer() // Pushes logo to bottom
                    
                    // Raiffeisen Logo at the bottom
                    Image("raiffeisen_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .background(Color.ciYellow)
                        .cornerRadius(10)
                        .padding(.bottom, -40)
                }
            }
            .frame(height: UIScreen.main.bounds.height / 2)
            .background(Color.ciYellow)
            
            // Welcome Text
            Text("HERZLICH WILLKOMMEN")
                .font(.title2)
                .fontWeight(.medium)
                .padding(.top, 60)
            
            Spacer()
            
            Text("Sie wurden aus Sicherheitsgründen abgemeldet.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
            
            // Login Buttons
            VStack(spacing: 15) {
                Button(action: {
                    isLoggedIn = true
                }) {
                    Text("FLORIAN RATH'S BEWERBUNG ANSEHEN")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.ciYellow)
                        .foregroundColor(.black)
                }
                
                Button(action: {
                    showAlert = true
                }) {
                    Text("ANDERE BEWERBUNG ANSEHEN")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.primary)
                }
            }
            .padding(.horizontal)
            .alert("Hinweis", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Diese Funktion ist aktuell nicht verfügbar.\n\nBitte sehen Sie sich stattdessen die Bewerbung von Florian Rath an.")
            }
        }
        .alert("Information", isPresented: $showInfoAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Dies ist eine Demo-App für die Bewerbung von Florian Rath bei der Raiffeisen Software GmbH.")
        }
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false))
}
