//
//  CardView.swift 
//
//  Created by Geoff on 20/7/21.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CardView: View {
    
    public var card : PlayingCard?
    @State var flipped = false // state variable used to update the card
 
    public var body: some View {
        SimpleCardView(card:card, flip:flipped)
              .padding()
              .rotation3DEffect(self.flipped ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
              .animation(.default) // implicitly applying animation
             /* .onTapGesture {
                  // explicitly apply animation on toggle (choose either or)
                  //withAnimation {
                      self.flipped.toggle()
                  //}
                 }*/
            .padding()
    }
    
    public init(card: PlayingCard?) {
        self.card = card
    
    }
}

@available(iOS 13.0, *)
public struct SimpleCardView: View {
    
    public var card : PlayingCard?
    var flipped : Bool
   
    public var body: some View {
        if card != nil{
         ZStack
          {
            if(self.flipped)
            {
                CardBackView()
            }
            else
            {
                CardFrontView(card: card!)
            }
          }
        }
    } 
    public init(card: PlayingCard?) {
        self.card = card
        self.flipped = false
    }
    public init(card: PlayingCard?, flip: Bool) {
        self.card = card
        self.flipped = flip
    }
}


@available(iOS 13.0, *)
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
       CardView(card: CardName.ace.of(.spades)!)
       
    }
}
