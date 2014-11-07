//
//  main.swift
//  GasPriceSatisfaction
//
//  Created by Adam Spindler on 6/4/14.
//  Copyright (c) 2014 expletek. All rights reserved.
//

import Foundation

// get all the gas stations in the area
let list = GasStationList(zipCode: "14623")
list.fetchList()

// figure out a possible combo for each gas station
for station in list.gasStations
{
    // get the gas price at the current station
    let price: Double = NSString(string: station.priceRegular).doubleValue
    if price == 0
    {
        continue
    }
    
    // just brute force it, try all dollar amounts between 1 and 50 until we find a combo that works
    for var i = 1.0; i <= 50.0; i++
    {
        if (price * i) % 1 == 0
        {
            println("\(i) gallons at \(station.priceRegular) from \(station.brand) at \(station.address)")
            break
        }
    }
}