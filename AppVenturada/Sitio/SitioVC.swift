//
//  SitioVC.swift
//  AppVenturada
//
//  Created by APPLE on 27/02/2020.
//  Copyright © 2020 Javier Roche. All rights reserved.
//

import UIKit

class SitioVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var sitios: [Sitio] = []
    
    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var zonas: UISegmentedControl!
    
    //MARK: Ciclo de vida del SitioVC
    //Esta funcion es lo primero que se ejecuta al cargarse una pantalla
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData("norte")
        self.setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabla.reloadData()
    }
    
    //MARK: Funciones
    func setupData(_ zona: String) {
        //Carga de datos desde los JSON
        if let pathURL = Bundle.main.url(forResource: "zona_\(zona)", withExtension: "json") {
            do {
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder()
                sitios = try decoder.decode([Sitio].self, from: data)
                tabla.reloadData()
            } catch {
                fatalError("No se puede leer el fichero JSON")
            }
        } else {
            fatalError("No se encuentra la ruta del archivo")
        }
    }
    
    func setupUI() {
        //Configuraremos el UITableView para que reconozca la clase de la celda
        let nib: UINib = UINib.init(nibName: "SitioTVCell", bundle: nil)
        self.tabla.register(nib, forCellReuseIdentifier: "SitioTVCell")
        
        //Test Equatable protocolo
        if (sitios[0] == sitios[1]) {
            print("Sitios iguales\nAdherido a CustomStringConvertible \(sitios[0].description)")
        } else {
            print("Sitios diferentes\nAdherido a CustomStringConvertible \(sitios[0].description)")
        }
    }
    
    
    //MARK: IBActions
    @IBAction func cambiaZona(_ sender: Any) {
        print("Zona \(zonas.selectedSegmentIndex) seleccionada")
        var zona : String = String()
        if self.zonas.selectedSegmentIndex == 0 {
            zona = "norte"
        } else {
            zona = "sur"
        }
        self.setupData(zona)
        self.tabla.reloadData()
    }
    
    
    //MARK: Delegados
    //MARK: - UITableViewDelegate
    //Se ejecuta al pulsar en una celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sitio = sitios[indexPath.row]
        let detalle = SitioVCDetalle.init(sitio)
        self.navigationController?.pushViewController(detalle, animated: true)
        tabla.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    //MARK: - UITableViewDatasource
    //Numero de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Numero de filas en la seccion
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return sitios.count
    }
    
    //Las celdas reusables se van llenando con los sitios del array de sitios
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Obligamos a que la celda sea del nuestro tipo celda
        if let cell = tabla.dequeueReusableCell(withIdentifier: "SitioTVCell", for: indexPath) as? SitioTVCell {
            cell.setSitio(sitios[indexPath.row])
            return cell
        }
        fatalError("No se pueden crear las celdas")
    }
}
