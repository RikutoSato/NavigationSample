//
//  ContentView.swift
//  SampleNavigation
//
//  Created by RikutoSato on 2023/08/27.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    // 値を渡したいViewModelをここで宣言する
    @ObservedObject private var zViewModel = ZViewModel()
    
    var body: some View {
        // ここNavigationStackにpath: $navigationManager.pathを認識させる
        NavigationStack(path: $navigationManager.path) {
            VStack(spacing: 30) {
                Button("AViewへ") {
                    // 遷移の仕方は、pathに入れたり消した入りするだけ。最初は[]で、↓の行を実行すると、[.aView]になる。
                    navigationManager.path.append(.aView)
                }
                
                Button("ZViewへ") {
                    // ここで値を渡す
                    zViewModel.name = "太郎"
                    // ここでViewModelをセットする
                    navigationManager.setCurrentViewModel(zViewModel)
                    navigationManager.path.append(.zView)
                }
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
