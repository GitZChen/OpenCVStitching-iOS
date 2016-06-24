//
//  ViewController.swift
//  OpenCVStitching
//
//  Created by Zhongtian Chen on 6/23/16.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var images : [UIImage] = [UIImage]()
        for i in 1...9 {
            images.append(UIImage(named: "DJI_000\(i).jpg")!)
        }
        for i in 0...9 {
            images.append(UIImage(named: "DJI_001\(i).jpg")!)
        }
        NSLog("\(images.count)")
        let stitchedImage : UIImage? = Stitching.stitchImageWithArray(NSMutableArray(array: images))
        imageView.image = stitchedImage
        if let stitchedImage = stitchedImage {
            UIImageWriteToSavedPhotosAlbum(stitchedImage, nil, nil, nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

