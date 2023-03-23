//
//  ViewController.swift
//  Simon dice
//
//  Created by imac on 21/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imvSplash: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imvSplash.frame = CGRect(x: (view.frame.width - imvSplash.frame.width) / 2.0, y: -imvSplash.frame.height, width: imvSplash.frame.width, height: imvSplash.frame.height)
        imvSplash.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2.5) {
            self.imvSplash.frame.origin.y = (self.view.frame.height - self.imvSplash.frame.height)/2.0
            self.imvSplash.alpha = 1.0

        } completion: { res in
            self.performSegue(withIdentifier: "sgSplash", sender: nil)
        }
    }


}

