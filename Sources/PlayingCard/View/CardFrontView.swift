//
//  File.swift
//  
// 
//  Created by Geoff Burns on 19/9/21.
//
 
import SwiftUI

@available(iOS 13.0, *)
public struct CardFrontView: View {
    public var card : PlayingCard
  
    public var imageFront: Image {
        return Image(card.imageName, bundle: Bundle.module)
           
    }
    
    public var body: some View {
    
                imageFront
                    .resizable()
                    .scaledToFit()
    }
}

@available(iOS 13.0, *)
struct CardFrontView_Previews: PreviewProvider {
    static var previews: some View {
        
        CardFrontView(card: CardName.ace.of(.spades)!)
    }
}
