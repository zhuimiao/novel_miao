//
//  ViewController.swift
//  novel_miao
//
//  Created by boitx on 2017/6/23.
//  Copyright © 2017年 boitx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let Url = URL.init(string: "http://www.piaotian.com/html/7/7981/4832987.html")
        
        let request = NSMutableURLRequest.init(url: Url!)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if (error != nil) {
                return
            }
            else {
                let enc = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue))
                let retStr = String.init(data: data!, encoding: String.Encoding(rawValue: enc))
                print(retStr ?? "");
                DispatchQueue.main.async { // Correct
                    self.textView.text = retStr
                }
                
            }
        }
        dataTask.resume();
        // Do any additional setup after loading the view, typically from a nib.
    }
    

}

