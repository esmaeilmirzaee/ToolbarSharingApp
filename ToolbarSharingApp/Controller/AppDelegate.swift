//
//  AppDelegate.swift
//  ToolbarSharingApp
//
//  Created by Esmaeil MIRZAEE on 24/12/2019.
//  Copyright © 2019 Esmaeil MIRZAEE. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  let statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
    statusBarItem.button?.title = "Toolbar App"
    statusBarItem.menu = NSMenu()
    let infoMenu = NSMenuItem(title: "App Info", action: #selector(showInfo(_:)), keyEquivalent: "i")
    statusBarItem.menu?.addItem(infoMenu)
    
    let showAppMenu = NSMenuItem(title: "Show App", action: #selector(showApp(_:)), keyEquivalent: "s")
    statusBarItem.menu?.addItem(showAppMenu)
  }

  @objc func showInfo(_ sender: NSMenuItem) {
    print("Showing info!")
    
    let alert = NSAlert()
    alert.messageText = "This app is developed by Esmaeil MIRZAEE"
    alert.informativeText = "This app was originally running in window but now it'll live in menu bar."
    alert.runModal()
  }
  
  @objc func showApp(_ sender: NSMenuItem) {
    print("Showing app!")
    let storyBoard = NSStoryboard(name: "Main", bundle: nil)
    guard let shareVC = storyBoard.instantiateController(withIdentifier: "shareVC") as? ShareViewController else { return }
    let popOver = NSPopover()
    popOver.contentViewController = shareVC
    popOver.behavior = .transient
    popOver.show(relativeTo: statusBarItem.button!.bounds, of: statusBarItem.button!, preferredEdge: .minY)
  }
  
  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }


}

