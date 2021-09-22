//
//  BuiltCardDeck.swift
//  
//  Cards
//
//  Created by Geoff Burns on 11/09/2015.
//  Copyright (c) 2015 Geoff Burns. All rights reserved.
//
import Foundation


open class BuiltCardDeck : DeckBase
{
    var deckOptions:IDeckOptions? = nil
    open var setOfSuitesInDeck = Set<PlayingCard.Suite>()
    open var suitesInDeck : [PlayingCard.Suite] = []
    open var normalSuitesInDeck : [PlayingCard.Suite] = []
    open var valuesInSuite : [PlayingCard.CardValue] = []
    
    var noOfPossibleCardsInDeck : Int {
        var result = (deckOptions!.noOfSuitesInDeck * deckOptions!.noOfCardsInASuite)
         if deckOptions!.hasTrumps
            {
            result += Game.settings.noOfTrumps
            }
         if deckOptions!.hasJokers
             {
             result += Game.settings.noOfJokers
             }
        return result
    }
    public init(deckOptions:IDeckOptions )
    {
        self.deckOptions = deckOptions
        normalSuitesInDeck = Array(PlayingCard.Suite.normalSuites[0..<deckOptions.noOfSuitesInDeck])
        suitesInDeck = normalSuitesInDeck
        if deckOptions.hasTrumps
        {
            suitesInDeck.append(PlayingCard.Suite.trumps)
           
        }
        if deckOptions.hasJokers
        {
            suitesInDeck.append(PlayingCard.Suite.jokers)
    
        } 
        setOfSuitesInDeck = Set<PlayingCard.Suite>(suitesInDeck)
        
    }
    
    func calculateNoOfCardsInEachSuite()
    {
        for s in normalSuitesInDeck
        {
            noInSuites[s.rawValue]  = deckOptions!.noOfCardsInASuite
        }
        noInSuites[PlayingCard.Suite.jokers.rawValue] = 0
        if deckOptions!.hasTrumps
        {
            noInSuites[PlayingCard.Suite.trumps.rawValue] = deckOptions!.noOfStandardTrumps
            if Game.settings.hasFool
            {
              if Game.settings.isFoolATrump
              { noInSuites[PlayingCard.Suite.trumps.rawValue] += 1 }
              else
              {   noInSuites[PlayingCard.Suite.jokers.rawValue] = 1 }
              }
        }
        if deckOptions!.hasJokers
        {
            noInSuites[PlayingCard.Suite.jokers.rawValue]  += deckOptions!.noOfJokers
        }
    }
    
    open func rankFor(_ card:PlayingCard) -> Int
    {
        switch card.value
        {
        case .ace : return 1
        case .pip(let n) : return n
        case .courtCard :
           return (valuesInSuite.firstIndex(of: card.value)  ?? -1) + 1
        }
    }
    func getRemovedLowCards(_ n: Int ) -> Set<PlayingCard> {
        var removedCards = Set<PlayingCard>()

        var removedSoFar = 0
        
        var pip = 2
        /// Make sure than the cards divide evenly between the players by removing low value cards until the pack size is a multiple of the number of players
        repeat
        {
            for s in normalSuitesInDeck
            {
                if removedSoFar >= n
                {
                    break
                }
                if s == deckOptions!.specialSuite
                {
                    continue
                    
                }
                removedCards.insert(PlayingCard(suite: s, value: PlayingCard.CardValue.pip(pip)))
                noInSuites[s.rawValue]  = noInSuites[s.rawValue] - 1
                removedSoFar+=1
            }
            pip+=1
        }
            while removedSoFar < n
        
        return removedCards
    }
    func getRemovedHighCards(_ n: Int ) -> Set<PlayingCard> {
        var removedCards = Set<PlayingCard>()
        let courtcards = ["K","Q","J"].map { PlayingCard.CardValue.courtCard($0) }
        var removedSoFar = 0
        
     
        /// Make sure than the cards divide evenly between the players by removing high value cards until the pack size is a multiple of the number of players
        repeat
        {
            for cardvalue in courtcards
            {
              for s in normalSuitesInDeck
              {
                if removedSoFar >= n
                {
                    break
                }
                if s == deckOptions!.specialSuite
                {
                    continue
                    
                }
                removedCards.insert(PlayingCard(suite: s, value: cardvalue))
                noInSuites[s.rawValue]  = noInSuites[s.rawValue] - 1
                removedSoFar+=1
              }
            }
        }
            while removedSoFar < n
        
        return removedCards
    }
    func getRemovedCards( ) -> Set<PlayingCard> {
   
        let toRemove = deckOptions!.makeDeckEvenlyDivisible
            ? noOfPossibleCardsInDeck % deckOptions!.noOfPlayersAtTable
            : 0
        
        if toRemove < 1 { return Set<PlayingCard>() }
        
        if deckOptions!.willRemoveLow { return getRemovedLowCards(toRemove) }
        
        return getRemovedHighCards(toRemove)
      
    }
    
    override open var orderedDeck:[PlayingCard]
        {
            var deck = [PlayingCard]();
   
            calculateNoOfCardsInEachSuite()
        
            let removedCards = getRemovedCards()
            
            valuesInSuite = PlayingCard.CardValue.valuesFor(deckOptions!.noOfCardsInASuite)
            for s in normalSuitesInDeck
            {
                for v in valuesInSuite
                {
                   let c = PlayingCard(suite: s, value: v)
                    if removedCards.contains(c)
                    {
                        continue
                    }
                    deck.append(c)
                }
            }
            
            if deckOptions!.hasTrumps
            {
                if deckOptions!.hasFool
                {
                   if deckOptions!.isFoolATrump
                   {deck.append(PlayingCard(suite: PlayingCard.Suite.trumps, value : PlayingCard.CardValue.pip(0)))}
                   else
                   {deck.append(PlayingCard(suite: PlayingCard.Suite.jokers, value : PlayingCard.CardValue.pip(0)))}
                    
                }
                for v in 1...deckOptions!.noOfStandardTrumps
                {
                    deck.append(PlayingCard(suite: PlayingCard.Suite.trumps, value : PlayingCard.CardValue.pip(v)))
                }
            }
            if deckOptions!.hasJokers
            {
                for v in 1...deckOptions!.noOfJokers
                {
                    deck.append(PlayingCard(suite: PlayingCard.Suite.jokers, value : PlayingCard.CardValue.pip(v)))
                }
            }
            return deck
    }
}
