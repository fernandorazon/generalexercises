//
//  Main.swift
//  Wheather
//
//  Created by d182_fernando_r on 03/03/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import Foundation

import UIKit


UIApplicationMain(CommandLine.argc,
                  UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(
                    to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc)),
                  NSStringFromClass(MyApplication.self), NSStringFromClass(AppDelegate.self)
)


