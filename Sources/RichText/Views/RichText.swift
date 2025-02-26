//
//  RichText.swift
//
//
//  Created by 이웅재(NuPlay) on 2021/07/26.
//  https://github.com/NuPlay/RichText

import SwiftUI

public struct RichText: View {
    @State private var dynamicHeight: CGFloat = .zero
    
    let html: String
    var configuration: Configuration
    var placeholder: AnyView?
    var code:String = ""
    
    public init(html: String,code:String, configuration: Configuration = .init(), placeholder: AnyView? = nil) {
        self.html = html
        self.configuration = configuration
        self.placeholder = placeholder
        self.code = code
    }

    public var body: some View {
        ZStack(alignment: .top) {
            WebView(dynamicHeight: $dynamicHeight, html: html, configuration: configuration,code: code)
                .frame(height: dynamicHeight)

            if self.dynamicHeight == 0 {
                placeholder
            }
        }
    }
}

struct RichText_Previews: PreviewProvider {
    static var previews: some View {
        RichText(html: "",code:"")
    }
}
