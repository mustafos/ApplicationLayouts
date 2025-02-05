//
//  AuthManager.swift
//  SupabaseAuth
//
//  Created by Mustafa Bekirov on 27.08.2023.
//

import Foundation
import Supabase

struct AppUser {
    let uid: String
    let email: String?
}

class AuthManager {
    
    static let shared = AuthManager()
    
    private init() {}
    
    let client = SupabaseClient(
        supabaseURL: URL(string: "https://ypcrzbibwjnnvedmywfm.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlwY3J6Ymlid2pubnZlZG15d2ZtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMxMzgzNjEsImV4cCI6MjAwODcxNDM2MX0.waHwBq9ian-TBmM0HbQz25_TB6NUOCwyHwV_nw90Khg")
    
    
    func getCurrentSession() async throws -> AppUser {
        let session = try await client.auth.session
        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
    }
    
    func registerNewUserWithEmail(email: String, password: String) async throws -> AppUser {
        let regAuthResponse = try await client.auth.signUp(email: email, password: password)
        guard let session = regAuthResponse.session else { throw NSError() }
        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
    }
    
    func signInWithEmail(email: String, password: String) async throws -> AppUser {
        let session = try await client.auth.signIn(email: email, password: password)
        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
    }

    func signInWithApple(email: String, password: String) async throws -> AppUser {
        let session = try await client.auth.signIn(email: email, password: password)
        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
    }
    
    func signInWithGoogle(email: String, password: String) async throws -> AppUser {
        let session = try await client.auth.signIn(email: email, password: password)
        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
    }
    
    // MARK: – BUGFIX .signInWithIdToken method with @_spi
//    func signInWithApple(idToken: String, nonce: String) async throws -> AppUser {
//        let session = try await client.auth.signInWithIdToken(credentials: .init(provider: .apple, idToken: idToken, nonce: nonce))
//        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
//    }
//
//    func signInWithGoogle(idToken: String, nonce: String) async throws -> AppUser {
//        let session = try await client.auth.signInWithIdToken(credentials: .init(provider: .google, idToken: idToken))
//        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
//    }
    
    func signOut() async throws {
        try await client.auth.signOut()
    }
}

//YOUR_SUPABASE_KEY_HERE
