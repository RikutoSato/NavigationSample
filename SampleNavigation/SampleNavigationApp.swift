//
//  SampleNavigationApp.swift
//  SampleNavigation
//
//  Created by RikutoSato on 2023/08/27.
//

import SwiftUI

@main
struct SampleNavigationApp: App {
    // ここの宣言忘れずに！！！
    @StateObject var navigationManager = NavigationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navigationManager) // 一番最初の画面にenviromentObjectを認識させる
        }
    }
}
