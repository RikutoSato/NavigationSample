//
//  Views.swift
//  SampleNavigation
//
//  Created by RikutoSato on 2023/08/27.
//

import SwiftUI

struct AView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    
    var body: some View {
        Button("BViewへ") {
            // [.aView, bView]
            navigationManager.path.append(.bView)
        }
        .navigationTitle("AView")
    }
}

struct BView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    
    var body: some View {
        Button("CViewへ") {
            // [.aView, bView, cView]
            navigationManager.path.append(.cView)
        }
        .navigationTitle("BView")
    }
}

struct CView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    
    var body: some View {
        Button("DViewへ") {
            // [.aView, bView, cView, dView]
            navigationManager.path.append(.dView)
        }
        .navigationTitle("CView")
    }
}

struct DView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    
    var body: some View {
        VStack(spacing: 30) {
            Button("トップへ") {
                // []
                navigationManager.path.removeAll()
            }
            Button("CViewへ") {
                // [.aView, bView, cView]
                // 一応、1以上あることを確認しているが、ここは確認なしでもよい。確認することでクラッシュは絶対防げる
                if navigationManager.path.count >= 1 {
                    navigationManager.path.removeLast(1)
                }
            }
            Button("BViewへ") {
                // [.aView, bView]
                // 一応、1以上あることを確認しているが、ここは確認なしでもよい。確認することでクラッシュは絶対防げる
                if navigationManager.path.count >= 2 {
                    navigationManager.path.removeLast(2)
                }
            }
            Button("AViewへ") {
                // [.aView]
                // 一応、1以上あることを確認しているが、ここは確認なしでもよい。確認することでクラッシュは絶対防げる
                if navigationManager.path.count >= 3 {
                    navigationManager.path.removeLast(3)
                }
            }
        }
        .navigationTitle("DView")
    }
}
