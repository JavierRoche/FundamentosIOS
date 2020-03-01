//
//  PersonaVCDetalleImagen.swift
//  AppVenturada
//
//  Created by APPLE on 29/02/2020.
//  Copyright © 2020 Javier Roche. All rights reserved.
//

import UIKit

class PersonaVCDetalleImagen: UITableViewCell {
    @IBOutlet weak var foto: UIImageView!
    
    func setPersona(_ persona: Persona) {
        if persona.imag == nil {
            foto.image = nil
        } else {
            foto.image = UIImage.init(named: persona.imag!)
        }
    }
}
