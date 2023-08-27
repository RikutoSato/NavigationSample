//
//  NavigationManager.swift
//  SampleNavigation
//
//  Created by RikutoSato on 2023/08/27.
//

import SwiftUI

/*
 ▫️画面を追加するとき
 ①ShowViewに追加する
 ②navigationDestinationに追加する。
 */

class NavigationManager: ObservableObject {
    @Published var path: [ShowView] = []
    var currentViewModel: Any?
    
    // ここでViewModelをセットする。
    func setCurrentViewModel(_ viewModel: Any) {
        currentViewModel = viewModel
    }
}

struct NavigationDestinationModifier: ViewModifier {
    @EnvironmentObject var navigationManager: NavigationManager
    
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: ShowView.self) { showView in // ②
                 let viewModel = navigationManager.currentViewModel
                
                switch showView {
                case .aView:
                    AView()
                case .bView:
                    BView()
                case .cView:
                    CView()
                case .dView:
                    DView()
                case .zView:
                    // 渡したい値がある場合はViewModelを返して渡す。
                    ZView(viewModel: viewModel as! ZViewModel)
                }
            }
    }
}

// ①
enum ShowView: Hashable {
    case aView
    case bView
    case cView
    case dView
    case zView
}
