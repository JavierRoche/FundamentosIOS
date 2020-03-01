//
//  SitioVCDetalle.swift
//  AppVenturada
//
//  Created by APPLE on 27/02/2020.
//  Copyright © 2020 Javier Roche. All rights reserved.
//

import UIKit

class SitioVCDetalle: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private weak var sitio: Sitio?
    @IBOutlet weak var tabla: UITableView!
    
    //MARK: Ciclo de vida del SitioVC
    //Esta funcion es lo primero que se ejecuta al cargarse una pantalla
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        //Configuraremos el UITableView para que reconozca los dos tipos de celda
        let nibTexto: UINib = UINib.init(nibName: "SitioVCDetalleTexto", bundle: nil)
        self.tabla.register(nibTexto, forCellReuseIdentifier: "SitioVCDetalleTexto")
        let nibImagen: UINib = UINib.init(nibName: "SitioVCDetalleImagen", bundle: nil)
        self.tabla.register(nibImagen, forCellReuseIdentifier: "SitioVCDetalleImagen")
    }
    
    convenience init(_ sitio: Sitio) {
        self.init(nibName: "SitioVCDetalle", bundle: nil)
        self.title = sitio.nom
        self.sitio = sitio
    }
    
    
    //MARK: Delegados
    // MARK: - UITableViewDelegate
    // Se ejecuta al pulsar en una celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //No se ejecuta por el metodo delegado siguiente
    }
    
    //Se ejecuta para permitir o NO la seleccion
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    //Hay dos altos de celda diferentes segun la celda llamada
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 414
        } else {
            return 160
        }
    }
    
    // MARK: - UITableViewDatasource
    //Numero de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //Numero de filas en la seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //Las celdas reusables se van llenando con los sitios del array de sitios
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Si la celda que se va a llenar es seccion 0 - fila 0 es una imagen
        if indexPath.section == 0 {
            //Obligamos a que la celda sea del tipo SitioVCDetalleImagen
            if let cell = tabla.dequeueReusableCell(withIdentifier: "SitioVCDetalleImagen", for: indexPath) as? SitioVCDetalleImagen {
                cell.foto.image = UIImage.init(named: self.sitio?.imag ?? "ImgTest")
                return cell
            }
            fatalError("No se pueden crear las celdas")
        } else {
            if let cell = tabla.dequeueReusableCell(withIdentifier: "SitioVCDetalleTexto", for: indexPath) as? SitioVCDetalleTexto {
                cell.direccion.text = self.sitio?.dir
                cell.descripcion.text = self.sitio?.desc
                return cell
            }
            fatalError("No se pueden crear las celdas")
        }
        
    }
}
