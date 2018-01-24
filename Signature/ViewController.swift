//
//  ViewController.swift
//  Signature
//
//  Created by Higher Visibility on 24/01/2018.
//  Copyright © 2018 Higher Visibility. All rights reserved.
//

import UIKit

class ViewController: UIViewController,YPSignatureDelegate {

    @IBOutlet weak var signatureView: YPDrawSignatureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signatureView.delegate = self
    }

    @IBAction func clearPressed(_ sender: UIButton) {
        
         self.signatureView.clear()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(_ sender: UIButton) {
        if let signatureImage = self.signatureView.getSignature(scale: 10) {
            
            // Saving signatureImage from the line above to the Photo Roll.
            // The first time you do this, the app asks for access to your pictures.
            UIImageWriteToSavedPhotosAlbum(signatureImage, nil, nil, nil)
            
            // Since the Signature is now saved to the Photo Roll, the View can be cleared anyway.
            self.signatureView.clear()
        }
    }
    func didStart() {
        print("start")
    }
    func didFinish() {
        print("finish")
    }

}

