//
//  StringExtension.swift
//  GobstonesSwift
//
//  Created by Nishant Bhasin on 2016-12-27.
//  Copyright © 2016 Nishant Bhasin. All rights reserved.
//

import Foundation
extension String {
    
    //To check text field or String is blank or not
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    //Validate Email
    var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
    
    /**
     Converts a ruby date string to an NSDate object. See rubyFormatter for accepted format.
     
     - returns: A NSDate or nil if the string is empty or cannot be formatted.
     */
    func convertDateFromString() -> Date? {
        if (self.isEmpty) {
            return nil
        }
            //  Grab the shared formatter which will speed up the conversion since we don't have to keep initializing it
        else {
            let formatter = DateFormatter()
            return formatter.date(from: self)
        }
        
    }
    
    
    //  MARK: - Variables
    
    /// The first character of the string
    var first: String {
        return String(characters.prefix(1))
    }
    
    /// The last character of the string
    var last: String {
        return String(characters.suffix(1))
    }
    
    /// Capitalizes only the first letter of the string that invokes the computation.
    var capitalizeFirst: String {
        return first.uppercased() + String(characters.dropFirst())
    }
    
    /// This string as a Float
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    
    /// This string as an Int
    var intValue: Int {
        return (self as NSString).integerValue
    }
    
    /// This string as a Double
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
    
    /// True if this string is a postive float
    var isValidPostiveFloat: Bool {
        let regex = try? NSRegularExpression(pattern: "^(?=.+)(?:[1-9]\\d*|0)?(?:\\.\\d+)?$", options: .caseInsensitive)
        return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.characters.count)) != nil
    }
    
    /// True if this string is a postive int
    var isValidPostiveInt: Bool {
        let regex = try? NSRegularExpression(pattern: "^\\d+$", options: .caseInsensitive)
        return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.characters.count)) != nil
    }
    
    /// True if this string contains only numbers and letters
    var isAlphaNumeric: Bool {
        let alpaNumericSet = CharacterSet.alphanumerics.inverted
        let string = (self as NSString)
        return (string.rangeOfCharacter(from: alpaNumericSet).location == NSNotFound)
    }
    
    /// True if this string is only letters and between 1 - 255 characeters
    var isValidName: Bool {
        let regex = try? NSRegularExpression(pattern: "^([a-zA-ZÀ-ÿ-]){1,255}$", options: .caseInsensitive)
        return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.characters.count)) != nil
    }
    
    /// True if this string is a valid email
    var isValidEmail: Bool {
        let regex = try? NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$", options: .caseInsensitive)
        return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.characters.count)) != nil
    }
    
    /// True if this string is a valid email for develop
    var isValidEmailDev: Bool {
        let regex = try? NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}([#][A-Z]+)?$", options: .caseInsensitive)
        return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.characters.count)) != nil
    }
    
    /// True if this string is a valid password.
    var isPasswordValid: Bool {
        return (self.characters.count > 7 && self.characters.count < 128)
    }
    
    /// True if this string contains only white space.
    var containsWhitespaceOnly: Bool {
        let whitespace = CharacterSet.whitespaces
        return self.trimmingCharacters(in: whitespace).isEmpty
    }
    
    //  MARK: - Subscripts
    
    /**
     Returns the character at the given index.
     
     - parameter integerIndex: The index of the character you want
     
     - returns: A character
     */
    subscript(integerIndex: Int) -> Character
    {
        let index = characters.index(startIndex, offsetBy: integerIndex)
        return self[index]
    }
    
    subscript(integerRange: Range<Int>) -> String
    {
        let start = characters.index(startIndex, offsetBy: integerRange.lowerBound)
        let end = characters.index(startIndex, offsetBy: integerRange.upperBound)
        let range = start..<end
        return self[range]
    }
    
    
    //  MARK: - Functions
    
    func contains(_ s: String) -> Bool
    {
        return (self.range(of: s) != nil) ? true : false
    }
    
    
    /**
     Splits a string into compoenats based on the separator given.
     
     - parameter separator: A string to split at.
     
     - returns: A array of string split
     */
    public func split(_ separator: String) -> [String] {
        if separator.isEmpty {
            return self.characters.map { String($0) }
        }
        if var pre = self.range(of: separator) {
            var parts = [self.substring(to: pre.lowerBound)]
            while let rng = self.range(of: separator, range: pre.upperBound..<endIndex) {
                parts.append(self.substring(with: pre.upperBound..<rng.lowerBound))
                pre = rng
            }
            parts.append(self.substring(with: pre.upperBound..<endIndex))
            return parts
        } else {
            return [self]
        }
    }
}
