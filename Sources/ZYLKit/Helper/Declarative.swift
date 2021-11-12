//
//  Declarative.swift
//  NativeDubai
//
//  Created by YiLin on 2021/7/14.
//  Copyright © 2021 Eric. All rights reserved.
//
//使宣告ui元件更為簡潔
//lazy var textField = UITextField {
//    $0.text = "abc"
//    $0.backgroundColor = .red
//    $0.delegate = self
//}

import Foundation

public protocol Declarative: AnyObject {
    init()
}

public extension Declarative {
    
    init(configureHandler: (Self) -> Void) {
        self.init()
        configureHandler(self)
    }
    
    func `do`(_ block: (Self) -> Void) {
        block(self)
    }
}

extension NSObject: Declarative { }
