//
//  ZView.swift
//  SampleNavigation
//
//  Created by RikutoSato on 2023/08/27.
//

import SwiftUI

struct ZView: View {
    // ここは宣言するんじゃなくて、もらうようにする。
    @ObservedObject var viewModel: ZViewModel
    @EnvironmentObject private var navigationManager: NavigationManager
    
    var body: some View {
        VStack {
            Text("もらった値：\(viewModel.name)")
            Button("戻る") {
                navigationManager.path.removeLast()
            }
        }
    }
}

class ZViewModel: ObservableObject {
    @Published private var model = ZModel()
    
    var name: String {
        get { model.name }
        set { model.name = newValue }
    }
}

struct ZModel {
    var name = ""
}

struct ZView_Previews: PreviewProvider {
    static var previews: some View {
        ZView(viewModel: ZViewModel())
    }
}
