//
//  CLib.swift
//  CWrap
//
//  Created by sparrow on 2019/10/25.
//  Copyright © 2019 SPARROWAPPS. All rights reserved.
//

import Foundation
import CLib

public class CWrap {
    
    public init() {
        
    }
    
    public func hello() -> String {
        let text = CLib.hello()
        return String(cString: text!)
    }
}

