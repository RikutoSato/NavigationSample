//
//  ContentView.swift
//  SampleNavigation
//
//  Created by RikutoSato on 2023/08/27.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    
    var body: some View {
        // ここNavigationStackにpath: $navigationManager.pathを認識させる
        NavigationStack(path: $navigationManager.path) {
            Button {
                // 遷移の仕方は、pathに入れたり消した入りするだけ。最初は[]で、↓の行を実行すると、[.aView]になる。
                navigationManager.path.append(.aView)
            } label: {
                Text("AViewへ")
            }
            .navigationTitle("トップ画面")
            .modifier(NavigationDestinationModifier()) // この画面にダーッと遷移先を書いてる記事がたくさんあるが、ここはContentViewなので、カスタムモディファイアを作っている。
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
