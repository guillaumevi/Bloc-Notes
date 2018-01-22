//
//  NotesTableViewController.swift
//  Bloc-Notes
//
//  Created by Guillaume on 21/01/2018.
//  Copyright © 2018 Guillaume Villette. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    private var noteBook: NoteBook!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let noteBookRead = read() {
            noteBook = noteBookRead
        } else {
            noteBook = NoteBook()
        }
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newNote(_ sender: Any) {
        let note: Note = Note()
        note.titre = "Nouvelle note"
        noteBook.add(note: note)
        tableView.reloadData()
    }
    
    @IBAction func save(_ sender: Any) {
        save()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteBook.listNotes().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as? NoteTableViewCell else {
            fatalError("Wrong cell type")
        }
        let note = noteBook.listNotes()[indexPath.row]
        cell.configure(with: note)
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "displayCell" {
            guard let destination = segue.destination as? NoteViewController else { return }
            guard let cell = sender as? UITableViewCell  else { return }
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            destination.note = noteBook.listNotes()[indexPath.row]
        }
    }
    
    // MARK: - Read & Write
    
    private func save() {
        guard let noteBookJson = try? JSONEncoder().encode(noteBook) else { return }
        guard let noteBookURL = noteBookURL() else { return }
        try? noteBookJson.write(to: noteBookURL)
    }
    
    private func read() -> NoteBook? {
        guard let noteBookURL = noteBookURL() else { return nil }
        guard let noteBookJson = try? Data(contentsOf: noteBookURL) else { return nil }
        return try? JSONDecoder().decode(NoteBook.self, from: noteBookJson)
    }
    
    private func noteBookURL() -> URL? {
        let manager = FileManager()
        guard let documentsFolderURL = manager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentsFolderURL.appendingPathComponent("notebook.json")
    }
    
}
