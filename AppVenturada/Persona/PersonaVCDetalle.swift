//
//  PersonaVCDetalle.swift
//  AppVenturada
//
//  Created by APPLE on 29/02/2020.
//  Copyright © 2020 Javier Roche. All rights reserved.
//

import UIKit

class PersonaVCDetalle: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private weak var persona: Persona?
    @IBOutlet weak var tabla: UITableView!

/*func didSet () {
    self.title = self.house?.name
    avatar.image = UIImage.init(named: self.house?.name ?? "")
    sigil.text = self.house?.seat
    words.text = self.house?.words
}*/

    override func viewDidLoad() {
        print("viewDidLoad-PersonaVCDetalle")
        super.viewDidLoad()
        self.setupUI()
    }

    func setupUI() {
        //Configuraremos el UITableView para que reconozca los dos tipos de celda
        let nibTexto: UINib = UINib.init(nibName: "PersonaVCDetalleTexto", bundle: nil)
        self.tabla.register(nibTexto, forCellReuseIdentifier: "PersonaVCDetalleTexto")
        let nibImagen: UINib = UINib.init(nibName: "PersonaVCDetalleImagen", bundle: nil)
        self.tabla.register(nibImagen, forCellReuseIdentifier: "PersonaVCDetalleImagen")
        print("Fin setupUI - PersonaVCDetalle")
    }

    convenience init(_ persona: Persona) {
        self.init(nibName: "PersonaVCDetalle", bundle: nil)
        self.title = persona.nom
        self.persona = persona
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
            return 220
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
            //Obligamos a que la celda sea del tipo PersonaVCDetalleImagen
            if let cell = tabla.dequeueReusableCell(withIdentifier: "PersonaVCDetalleImagen", for: indexPath) as? PersonaVCDetalleImagen {
                cell.foto.image = UIImage.init(named: self.persona?.imag ?? "ImgTest")
                return cell
            }
            fatalError("No se pueden crear las celdas")
        } else {
            //Obligamos a que la celda sea del tipo PersonaVCDetalleTexto
            if let cell = tabla.dequeueReusableCell(withIdentifier: "PersonaVCDetalleTexto", for: indexPath) as? PersonaVCDetalleTexto {
                cell.nombre.text = self.persona?.nom
                cell.mote.text = self.persona?.mote
                cell.edad.text = "\(self.persona?.edad.description ?? "") años"
                cell.zona.text = "Zona \(self.persona?.lat ?? "")"
                cell.descripcion.text = self.persona?.desc
                return cell
            }
            fatalError("No se pueden crear las celdas")
        }
    }
}
