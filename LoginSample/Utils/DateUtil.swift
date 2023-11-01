/*
---HOW TO USE---
 
date2md(), date2ymd(), date2ymd_hmz()
- set Date() instance and locale abbreviation(option) to return each format date string.
 
 ex. 1
 let date = Date()
 date2md(date) // -> "04/24"(current locale time)
 
 ex. 2
 let date = Date()
 date2ymd_hmz(date, "PST") // -> "2023/04/23 16:43 PST"
 
 
 afterDate()
 - set number to return `N` days later
 
 ex. 3
 //suppose today is 21st May
 afterDate(4)  // -> an instance of 25th May
 
 afterDate(-3) // -> an instance of 18th May

----------------
*/

import Foundation

struct DateUtil {
    
    typealias UnixTimeStamp = Int
    
    enum DateStrFormat: String {
        case ymd = "yyyy/MM/dd"
        case dmy = "dd MMM yyyy"
        case ymdhm = "yyyy/MM/dd HH:mm"
        case dmyhm = "dd MMM yyyy HH:mm"

    }
    
    enum Localeidentifier: String {
        case us = "en_US"
        case jp = "ja_JP"
    }
    
    private static func date2str(_ date: Date,
                                 localeStr: String? = nil,
                                 strType: String) -> String {
        
        let formatter = DateFormatter()
        
        if let localeStr = localeStr {
            formatter.timeZone = TimeZone(identifier: localeStr)
        } else {
            formatter.timeZone = TimeZone.current
        }
        
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = strType
        return formatter.string(from: date)
    }
    
    static func afterDate(_ afterDate: Int, targetDate: Date = Date()) -> Date {
        return Calendar.current.date(byAdding: .day, value: afterDate, to: targetDate)!
    }
    
    static func date2md(_ date: Date = Date(), localeStr: String? = nil) -> String {
        return DateUtil.date2str(date, localeStr: localeStr, strType: "MM/dd")
    }
    
    static func date2ymd(_ date: Date = Date(), localeStr: String? = nil, separator: String = "/") -> String {
        return DateUtil.date2str(date, localeStr: localeStr, strType: "yyyy\(separator)MM\(separator)dd")
    }
    
    static func date2dmy(_ date: Date = Date(), localeStr: String? = nil) -> String {
        return DateUtil.date2str(date, localeStr: localeStr, strType: DateStrFormat.dmy.rawValue)
    }
    
    static func date2ymd_hm(_ date: Date = Date(), localeStr: String? = nil) -> String {
        return DateUtil.date2str(date, localeStr: localeStr, strType: DateStrFormat.ymdhm.rawValue)
    }
    
    static func date2ymd_hmz(_ date: Date = Date(), localeStr: String? = nil) -> String {
        return DateUtil.date2str(date, localeStr: localeStr, strType: "yyyy/MM/dd HH:mm zzz")
    }
    
    static func date2hm(_ date: Date = Date(), localeStr: String? = nil) -> String {
        return DateUtil.date2str(date, localeStr: localeStr, strType: "HH:mm")
    }
    
    static func str2date(_ dateStr: String, _ format: DateStrFormat) -> Date? {
        let fm = DateFormatter()
        fm.dateFormat = format.rawValue
        fm.locale = Locale(identifier: "en_US_POSIX")
        
        return fm.date(from: dateStr) ?? nil
    }

}

extension Date {
    
    func unix2Date() -> String {
        let fm = DateFormatter()
        fm.timeZone = TimeZone.current
        fm.locale = Locale(identifier: "en_US_POSIX")
        fm.dateFormat = "dd MMM yyyy"
        
        return fm.string(from: self)
    }
    
    func getDay() -> Int? {
        let fm = DateFormatter()
        fm.timeZone = TimeZone.current
        fm.locale = Locale(identifier: "en_US_POSIX")
        fm.dateFormat = "E"
        
        if fm.string(from: self) == "Sun" {
            return 0
            
        } else if fm.string(from: self) == "Mon" {
            return 1
            
        } else if fm.string(from: self) == "Tue" {
            return 2
            
        } else if fm.string(from: self) == "Wed" {
            return 3
            
        } else if fm.string(from: self) == "Thu" {
            return 4
            
        } else if fm.string(from: self) == "Fri" {
            return 5
            
        } else if fm.string(from: self) == "Sat" {
            return 6
            
        } else {
            return nil
        }
    }
    
    func getDate() -> Int {
        let fm = DateFormatter()
        fm.timeZone = TimeZone.current
        fm.locale = Locale(identifier: "en_US_POSIX")
        fm.dateFormat = "dd"

        return Int(fm.string(from: self)) ?? 0
    }
    
    func getMonth() -> Int {
        let fm = DateFormatter()
        fm.timeZone = TimeZone.current
        fm.locale = Locale(identifier: "en_US_POSIX")
        fm.dateFormat = "MM"
        
        return Int(fm.string(from: self)) ?? 0
    }
    
    func getYear() -> Int {
        let fm = DateFormatter()
        fm.timeZone = TimeZone.current
        fm.locale = Locale(identifier: "en_US_POSIX")
        fm.dateFormat = "yyyy"
        
        return Int(fm.string(from: self)) ?? 0
    }
    
    func getHours() -> Int {
        let fm = DateFormatter()
        fm.timeZone = TimeZone.current
        fm.locale = Locale(identifier: "en_US_POSIX")
        fm.dateFormat = "HH"
        
        return Int(fm.string(from: self)) ?? 0
    }
    
    func getMinutes() -> Int {
        let fm = DateFormatter()
        fm.timeZone = TimeZone.current
        fm.locale = Locale(identifier: "en_US_POSIX")
        fm.dateFormat = "mm"
        
        return Int(fm.string(from: self)) ?? 0
    }

}
