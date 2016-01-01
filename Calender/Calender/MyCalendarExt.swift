//
//  MyCalendarExt.swift
//  Calender
//
//  Created by 堤隆道 on 2015/10/14.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import Foundation
extension MyCalendar {
    func gotoNextMonth() {
        if month == 12 {
            month = 1
            year++
        } else {
            month++
        }
    }
    
    func gotoPrevMonth() {
        if month == 1 {
            month == 12
            year--
        } else {
            month--
        }
    }
}
