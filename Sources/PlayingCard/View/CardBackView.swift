//
//  CardBackView.swift
//  
//
//  Created by Geoff Burns on 19/9/21.
//

import SwiftUI

struct CardBackView: View {
    
    @EnvironmentObject var theme : Theme
    
    public var imageBack: Image {
        return Image(theme.cardBackName, bundle: Bundle.module)
            
    }
    var body: some View {
        imageBack
            .resizable()
            .scaledToFit()
    }
}

struct CardBackView_Previews: PreviewProvider {
    static var previews: some View {
        CardBackView().environmentObject(Theme())
    }
}
