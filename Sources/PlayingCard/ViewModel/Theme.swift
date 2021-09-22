//
//  Theme.swift
//  
//
//  Created by Geoff Burns on 19/9/21.
//
  
import SwiftUI
  
public class Theme: ObservableObject  {
    
    @Published public var backgroundColor : Color = .green
    @Published public var foregroundColor : Color = .white
    @Published public var index : Int = 1
    public var cardBackName : String { "Back\(index)" }
    
    public init () {}
     
}


