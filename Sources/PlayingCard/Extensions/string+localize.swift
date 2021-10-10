//
//  stringExtensions.swift 
//
//  Created by Geoff Burns on 18/11/2015.
//  Copyright © 2015 Geoff Burns. All rights reserved.
//

import Foundation

extension String
{
    public var pcLocal : String
    {
            return NSLocalizedString(self,
                                     tableName: nil,
                                     bundle: .module,
                                     value: "",
                                     comment: "")
    }
     
    
}

