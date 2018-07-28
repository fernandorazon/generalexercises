//
//  ViewController.swift
//  DetectarTexto
//
//  Created by d182_fernando_r on 22/06/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        
        //Dado que vision trabaja la imagen como frame no importa permitir constraints
        let iv = UIImageView()
        iv.image = UIImage(named: "unknown")
        iv.backgroundColor = UIColor.red
        iv.layer.cornerRadius = 5
        iv.layer.masksToBounds = true
        
        return iv
        
    }()
    
    let resultLabel: UILabel = {
        
        let lb = UILabel()
        lb.text = ""
        lb.font = UIFont(name: "Arial", size: 20)
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupLayout()
        self.findText()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLayout(){
        
        view.addSubview(imageView)
        view.addSubview(resultLabel)
        
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        resultLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        dump(self.imageView.bounds)
    }
    
    func findText(){
        //Se encuentra el texto en la imagen deseada
        var textLayers: [CAShapeLayer] = []
        
        let textDetectionRequest = VNDetectTextRectanglesRequest { (request, error) in
            guard let observations = request.results as? [VNTextObservation] else {
                print("Fatal error")
                return
            }
            
            dump(self.imageView.bounds.height)
            textLayers = self.addShapesToText(forObservations: observations, withImageView: self.imageView)
        }
        
        if let image = self.imageView.image, let cgImage = image.cgImage {
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            
            guard let _ = try? handler.perform([textDetectionRequest]) else {
                return print("No se pudo hacer la deteccion de texto")
            }
            
            for layer in textLayers {
                self.imageView.layer.addSublayer(layer)
            }
            
        }
        
    }
    
    //Esta funcion solo regresa un arreglo de los limites de la imagen
    func addShapesToText(forObservations observations: [VNTextObservation], withImageView textImageView: UIImageView) -> [CAShapeLayer] {
        
        let layers: [CAShapeLayer] = observations.map { observation in
            let w = observation.boundingBox.size.width * textImageView.bounds.width
            let h = observation.boundingBox.size.height * textImageView.bounds.height
            let x = observation.boundingBox.origin.x * textImageView.bounds.width
            let y = abs(((observation.boundingBox.origin.y * (textImageView.bounds.height)) - textImageView.bounds.height)) - h
            
            
            let layer = CAShapeLayer()
            layer.frame = CGRect(x: x, y: y, width: w, height: h)
            layer.borderColor = UIColor.red.cgColor
            layer.cornerRadius = 5
            layer.borderWidth = 5
            
            return layer
            
        }
        
        return layers
        
    }


}













