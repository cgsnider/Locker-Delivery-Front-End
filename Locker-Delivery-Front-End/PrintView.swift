//
//  PrintView.swift
//  Locker-Delivery-Front-End
//
//  Created by Charles Snider on 10/17/22.
//

import SwiftUI

struct PrintView: View {
    
    @State var data: String
    
    var body: some View {
        Text(data)
    }
}

struct PrintView_Previews: PreviewProvider {
    static var previews: some View {
        PrintView(data:"Test")
    }
}
