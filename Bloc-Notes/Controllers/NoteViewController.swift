//
//  NoteViewController.swift
//  Bloc-Notes
//
//  Created by Guillaume on 21/01/2018.
//  Copyright © 2018 Guillaume Villette. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet weak var noteTitle: UITextField!
    @IBOutlet weak var noteContent: UITextView!
    var note: Note?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard note != nil else { return }
        title = note!.titre
        noteTitle.text = title
        noteContent.text = note!.contenu
        
        navigationItem.largeTitleDisplayMode = .never
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
