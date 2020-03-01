//
//  SitioTVCell.swift
//  AppVenturada
//
//  Created by APPLE on 27/02/2020.
//  Copyright © 2020 Javier Roche. All rights reserved.
//

import UIKit

class SitioTVCell: UITableViewCell {
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var zona: UILabel!
    @IBOutlet weak var descripcion: UILabel!
    
    override func awakeFromNib() {
        foto.layer.cornerRadius = 8
        foto.layer.borderColor  = UIColor.white.withAlphaComponent(0.2).cgColor
        foto.layer.borderWidth  = 1.0
    }
    
    //MARK: Funciones
    func setSitio(_ sitio: Sitio) {
        if sitio.imag == nil {
            foto.image = nil
        } else {
            foto.image = UIImage.init(named: sitio.imag!)
        }
        nombre.text  = sitio.nom
        zona.text = "Zona \(sitio.lat)"
        descripcion.text = sitio.desc
    }
}
