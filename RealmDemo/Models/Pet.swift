//
//  Pet.swift
//  RealmDemo
//
//  Created by chander bhushan on 18/06/19.
//  Copyright © 2019 SwiftSeries. All rights reserved.
//

import Foundation
import RealmSwift

class Pet: Object {
    @objc dynamic var petName = ""
    @objc dynamic var owner : User?
}
