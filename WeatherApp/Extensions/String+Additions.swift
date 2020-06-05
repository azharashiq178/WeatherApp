//
//  String+Additions.swift
//  FanTazTech
//
//  Created by Muhammad Azher on 15/01/2018.
//  Copyright © 2018 Expertinsol. All rights reserved.
//


import Foundation

extension String {
    var length: Int {
        return self.count
//        return characters.count
        
    }
    
    mutating func removeFirstCharacter() -> Character {
        return remove(at: startIndex)
    }
    
    func characterAtIndex(_ index: Int) -> Character {
        
        return self[self.index(startIndex, offsetBy: index)]
    }
    
    mutating func insertCharacter(_ character: Character, atIndex index: Int) -> () {
        
        guard index < length else { return }
        
        insert(character, at: self.index(startIndex, offsetBy: 4))
    }
    
    func dateFromString(_ pattern:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = pattern
        return dateFormatter.date(from: self)
    }
    
    
    
    var toPhoneNumberFormatted: String {
        get {
//            let numberString = "+" + self
//            let number = try? PhoneNumberKit().parse(numberString).numberString
//            return number ?? self
            if self.isEmpty {
                return "N/A"
            }
            return toPhoneNumberFormattedWithoutPhoneKit
        }
    }
    var toPhoneNumberFormattedWithoutPhoneKit: String {
        get {
            return "+" + self
        }
    }
    
    var toNumbersOnly: String {
        get {
            let number = self.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "+", with: "")
            return number
        }
    }
    
    
    func isEmailValid() -> Bool {
        let regex = try? NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        
        return regex?.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    
//    static let okString = R.string.localizable.ok()
//    static let cancelString = R.string.localizable.cancel()
//    static let jaString = R.string.localizable.yes()
//    static let neeString = R.string.localizable.no()
}
