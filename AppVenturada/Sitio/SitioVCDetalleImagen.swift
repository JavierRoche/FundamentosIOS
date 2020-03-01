//
//  SitioVCDetalleImagen.swift
//  AppVenturada
//
//  Created by APPLE on 27/02/2020.
//  Copyright © 2020 Javier Roche. All rights reserved.
//

import UIKit

class SitioVCDetalleImagen: UITableViewCell {
    @IBOutlet weak var foto: UIImageView!
        
    func setSitio(_ sitio: Sitio) {
        if sitio.imag == nil {
            foto.image = nil
        } else {
            foto.image = UIImage.init(named: sitio.imag!)
        }
    }
}
