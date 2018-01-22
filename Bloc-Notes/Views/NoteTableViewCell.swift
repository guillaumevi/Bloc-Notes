//
//  NoteTableViewCell.swift
//  Bloc-Notes
//
//  Created by Guillaume on 22/01/2018.
//  Copyright © 2018 Guillaume Villette. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var contenu: UILabel!
    @IBOutlet weak var date: UILabel!
    
    private let formatter = DateFormatter()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with note:Note) {
        titre.text = note.titre
        contenu.text = note.contenu
        date.text = formatter.string(from: note.modificationDate)
    }

}
