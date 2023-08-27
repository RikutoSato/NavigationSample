//
//  NavigationManager.swift
//  SampleNavigation
//
//  Created by RikutoSato on 2023/08/27.
//

import SwiftUI

class NavigationManager: ObservableObject {
    @Published var path: [ShowView] = []
    var currentViewModel: Any?
    
    func setCurrentViewModel(_ viewModel: Any) {
        currentViewModel = viewModel
    }
}

struct NavigationDestinationModifier: ViewModifier {
    @EnvironmentObject var navigationManager: NavigationManager
    
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: ShowView.self) { showView in
                // let viewModel = navigationManager.currentViewModel
                
                switch showView {
                case .aView:
                    AView()
                case .bView:
                    BView()
                case .cView:
                    CView()
                case .dView:
                    DView()
                }
            }
    }
}

enum ShowView: Hashable {
    case aView
    case bView
    case cView
    case dView
}
