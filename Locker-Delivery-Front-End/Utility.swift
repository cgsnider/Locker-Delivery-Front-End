//
//  Utility.swift
//  Locker-Delivery-Front-End
//
//  Created by Charles Snider on 10/17/22.
//

//Put General Utility functions here


import SwiftUI

struct Utiltiy {
    
  
    
}

struct ExDivider: View {
    let color: Color = .black
    let width: CGFloat = 2
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}
