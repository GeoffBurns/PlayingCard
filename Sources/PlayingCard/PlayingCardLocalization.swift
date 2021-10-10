//
//  PlayingCardLocalization.swift 
//
//  Created by Geoff Burns on 10/10/21.
//

import Foundation
import Utilities


public class PlayingCardLocalization : ILocalizationRepository
{
    public func get(_ phrase: String) -> String {
        return NSLocalizedString(phrase,
                                 tableName: nil,
                                 bundle: .module,
                                 value: "",
                                 comment: "")
    }
    
    public static let shared = PlayingCardLocalization()
  
    public func register()
    {
        LocalizationRegistry.shared.registry.append(PlayingCardLocalization.shared)
    }
}

