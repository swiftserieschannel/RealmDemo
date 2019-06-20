//
//  User.swift
//  RealmDemo
//
//  Created by chander bhushan on 18/06/19.
//  Copyright © 2019 SwiftSeries. All rights reserved.
//

import Foundation
import RealmSwift

class User:Object {
    @objc dynamic var name = ""
    @objc dynamic var pet : Pet?
}
