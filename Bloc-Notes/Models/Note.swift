//
//  Note.swift
//  Bloc-Notes
//
//  Created by Guillaume on 21/01/2018.
//  Copyright © 2018 Guillaume Villette. All rights reserved.
//

import Foundation

class Note: Codable {
    var titre: String = ""
    var contenu: String = ""
    var modificationDate: Date = Date()
}
