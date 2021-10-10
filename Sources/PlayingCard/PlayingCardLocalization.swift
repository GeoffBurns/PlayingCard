//
//  PlayingCardLocalization.swift 
//
//  Created by Geoff Burns on 10/10/21.
//

import Foundation
import Utilities


public class PlayingCardLocalization : ILocalizationRepository
{

    
    public static let shared = PlayingCardLocalization()
  
    public func get(_ phrase: String) -> String {
        return NSLocalizedString(phrase,
                                 tableName: nil,
                                 bundle: .module,
                                 value: "",
                                 comment: "")
    }
    public func register()
    {
        LocalizationRegistry.register(PlayingCardLocalization.shared)
    }
    public static func get(_ phrase: String) -> String {
        return PlayingCardLocalization.shared.get(phrase)
    }
    public static func register()
    {
        PlayingCardLocalization.shared.register()
    }
}

