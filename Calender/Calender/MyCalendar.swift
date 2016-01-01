//
//  MyCalendar.swift
//  Calender
//
//  Created by 堤隆道 on 2015/10/14.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import Foundation

class MyCalendar {
    var year: Int
    var month: Int
    
    private let gCal = NSCalendar(identifier:NSGregorianCalendar)!
    
    init() {
        let today = NSDate()
        let flags: as [NSCalendarUnit] = .CalendarUnitYear | .CalendarUnitMonth
        let comps = gCal.components(flags, fromDate:today)
        year = comps.year
        month = comps.month
    }
    
    private func weekDayOfFirstDay() -> Int {
        let comps = NSDateComponents()
        comps.day = 1;
        comps.year = year
        comps.month = month
        let theDay = gCal.dateFromComponents(comps)!
        let weekdayComps = gCal.components(NSCalendarUnit.CalendarUnitWeekday, fromDate: theDay)
        
        return weekdayComps.weekday
    }
    
    private func daysOfMonth(month:Int, year:Int) -> {
        let dayComp = NSDateComponents()
        dayComp.year = year
        dayComp.month = month
        dayComp.day = 1
        let theDay = gCal.dateFromComponents(dayComp)!
        let rangeDays = gCal.rangeOfUnit(NSCalendarUnit.CalendarUnitDay, inUnit:NSCalendarUnit.CalendarUnitMonth, forDate: theDay)
        
        return rangeDays.length
    }
    
    func calendarString() -> String {
        var column = 1
        var calStr = " Su Mo Tu We Th Fr Sa\n"
        
        for _ in 1..<self.weekDayOfFirstDay() {
            calStr += "  "
            column++
        }
        
        var day:String
        for i in 1...self.dayOfMonth(self.month, year:self.year) {
            if i < 10 {
                day = "  \(i)"
            } else {
                day = " \(i)"
            }
        }
    }
}