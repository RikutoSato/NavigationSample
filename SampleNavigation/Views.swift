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
        Button {
            // [.aView, bView]
            navigationManager.path.append(.bView)
        } label: {
            Text("BViewへ")
        }
        .navigationTitle("AView")
    }
}

struct BView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    
    var body: some View {
        Button {
            // [.aView, bView, cView]
            navigationManager.path.append(.cView)
        } label: {
            Text("CViewへ")
        }
        .navigationTitle("BView")
    }
}

struct CView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    
    var body: some View {
        Button {
            // [.aView, bView, cView, dView]
            navigationManager.path.append(.dView)
        } label: {
            Text("DViewへ")
        }
        .navigationTitle("CView")
    }
}

struct DView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    
    var body: some View {
        VStack(spacing: 30) {
            Button {
                // []
                navigationManager.path.removeAll()
            } label: {
                Text("トップへ")
            }
            Button {
                // [.aView, bView, cView]
                // 一応、1以上あることを確認しているが、ここは確認なしでもよい。確認することでクラッシュは絶対防げる
                if navigationManager.path.count >= 1 {
                    navigationManager.path.removeLast(1)
                }
            } label: {
                Text("CViewへ")
            }
            Button {
                // [.aView, bView]
                // 一応、1以上あることを確認しているが、ここは確認なしでもよい。確認することでクラッシュは絶対防げる
                if navigationManager.path.count >= 2 {
                    navigationManager.path.removeLast(2)
                }
            } label: {
                Text("BViewへ")
            }
            Button {
                // [.aView]
                // 一応、1以上あることを確認しているが、ここは確認なしでもよい。確認することでクラッシュは絶対防げる
                if navigationManager.path.count >= 3 {
                    navigationManager.path.removeLast(3)
                }
            } label: {
                Text("AViewへ")
            }
        }
        .navigationTitle("DView")
    }
}
