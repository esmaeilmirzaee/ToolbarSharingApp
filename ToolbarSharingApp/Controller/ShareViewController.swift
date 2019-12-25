//
//  ShareViewController.swift
//  ToolbarSharingApp
//
//  Created by Esmaeil MIRZAEE on 24/12/2019.
//  Copyright © 2019 Esmaeil MIRZAEE. All rights reserved.
//

import Cocoa

class ShareViewController: NSViewController {

  @IBOutlet var shareTextField: NSTextField!
  @IBOutlet var shareImageView: NSImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }
  
  @IBAction func share(_ sender: NSView) {
    guard let image = shareImageView.image else { return }
    let text = shareTextField.stringValue
    let picker = NSSharingServicePicker(items: [image, text])
    picker.show(relativeTo: .zero, of: sender, preferredEdge: .minY)
  }
    
}
