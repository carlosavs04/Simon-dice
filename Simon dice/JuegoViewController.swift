//
//  JuegoViewController.swift
//  Simon dice
//
//  Created by imac on 21/02/23.
//

import UIKit

class JuegoViewController: UIViewController {

    @IBOutlet weak var btnJugar: UIButton!
    @IBOutlet var btnTablero: [UIButton]!
    
    var secuencia:[Int] = []
    var indice = -1
    var velocidad = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for boton in btnTablero {
            boton.layer.cornerRadius = 75
        }
    }
    
    @IBAction func encenderBtn(_ sender: UIButton) {
        sender.alpha = 1.0
    }
    
    @IBAction func apagarBtn(_ sender: UIButton) {
        sender.alpha = 0.5
        
        if sender.tag == secuencia[indice] {
            indice += 1
            
            if indice == secuencia.count {
                velocidad -= 0.05
                if velocidad < 0.15 {
                    velocidad = 0.15
                }
                generarAleatorio()
                habilitarTablero(false)
            }
            
        } else {
            let alerta = UIAlertController(title: "HAS PERDIDO", message: "Lograste llegar a la ronda" + String(secuencia.count), preferredStyle: .alert)
            let ok = UIAlertAction(title: "Aceptar", style: .cancel)
            alerta.addAction(ok)
            self.present(alerta, animated: true)
            
            habilitarTablero(false)
            btnJugar.isEnabled = true
        }
    }
    
    @IBAction func empezarJuego() {
        btnJugar.isEnabled = false
        secuencia.removeAll()
        velocidad = 0.5
        generarAleatorio()
    }
    
    func habilitarTablero (_ valor: Bool) {
        for boton in btnTablero {
            boton.isEnabled = valor
        }
    }
    
    func generarAleatorio() {
        indice = -1
        
        secuencia += [Int.random(in: 0 ..< btnTablero.count)]
        Timer.scheduledTimer(withTimeInterval: velocidad, repeats: false) { timer in
            self.encenderSecuencia()
        }
    }
    
    func encenderSecuencia() {
        indice += 1
        
        if indice < secuencia.count {
            btnTablero[secuencia[indice]].alpha = 1.0
            Timer.scheduledTimer(withTimeInterval: velocidad, repeats: false) { time in
                self.apagarSecuencia()
            }
        } else {
            indice = 0
            habilitarTablero(true)
        }
    }
    
    func apagarSecuencia() {
        btnTablero[secuencia[indice]].alpha = 0.5
        Timer.scheduledTimer(withTimeInterval: velocidad, repeats: false) { time in
            self.encenderSecuencia()
        }
    }
}
