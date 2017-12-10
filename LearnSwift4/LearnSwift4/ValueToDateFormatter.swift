//
//  ValueToDateFormatter.swift
//  LearnSwift4
//
//  Created by Abdul Majeed K on 10/12/17.
//  Copyright © 2017 Wafa Fathima. All rights reserved.
//

import Foundation

class ValueToDateFormatter: Formatter {

    override func string(for obj: Any?) -> String? {
        if let number = obj as? NSNumber {
            let timeInterval = number.doubleValue
            let date = Date.init(timeIntervalSinceReferenceDate: timeInterval)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
