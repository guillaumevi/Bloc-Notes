//
//  NoteBook.swift
//  Bloc-Notes
//
//  Created by Guillaume on 21/01/2018.
//  Copyright © 2018 Guillaume Villette. All rights reserved.
//

import Foundation

class NoteBook: Codable {
    
    private var notes: [Note] = []
    
    func add(note: Note) {
        notes.append(note)
    }
    
    func listNotes() -> [Note] {
        return notes
    }
}
