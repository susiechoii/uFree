//
//  applicationApp.swift
//  uFree

import SwiftUI

@main
struct applicationApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            IntroPageView()
        }
    }
}
//Nico
