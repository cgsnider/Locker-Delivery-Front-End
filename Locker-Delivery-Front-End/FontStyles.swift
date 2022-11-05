//
//  FontStyles.swift
//  Locker-Delivery-Front-End
//
//  Created by TJ Crawford on 10/7/22.
//

import Foundation
import SwiftUI

extension Font {
    static var Title: Font {
        return Font.custom("Inter-SemiBold", size: 48)
    }
    
    static var CreateTitle: Font {
        return Font.custom("Inter-SemiBold", size: 33)
    }
    
    static var SubTitle2: Font {
        return Font.custom("Inter-SemiBold", size: 27)
    }
    
    static var SubTitle: Font {
        return Font.custom("Inter-SemiBold", size: 20)
    }
    
    static var ForgetPasswordText: Font {
        return Font.custom("Inter-Regular", size: 13)
    }
    
    static var TextField: Font {
        return Font.custom("Inter-Regular", size: 32)
    }
    
    static var MenuBold: Font {
        return Font.custom("Inter-SemiBold", size: 15)
    }
}
