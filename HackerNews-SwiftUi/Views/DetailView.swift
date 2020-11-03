//
//  DetailView.swift
//  HackerNews-SwiftUi
//
//  Created by Csongor Keller on 03/11/2020.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://google.com")
    }
}
