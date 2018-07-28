//
//  MessagesStore.swift
//  BunsanMessenger
//
//  Created by Misael Pérez Chamorro on 6/1/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import Foundation

//Es el encargado del almacenamiento de mensajes
//Es un singleton

class MessagesStore: NSObject {
    //Esta propiedad es inmutable y estatica
  static let sharedInstance = MessagesStore()
  var messages: [Message] = []
  
    //Esto asegura que esta clase sea un singleton
    //Por lo que nadie podra llamarlo si no es
    //A traves del sharedInstance
  private override init() {
    super.init()
    
  }
  
  func fetchMessagesFromJson() {
    guard let jsonItems = File.readMessages() else {return}
    
    for message in jsonItems {
      let name = message["name"]
      let content = message["content"]
      let url = message["url"]
      let _ = createMessage(content: content!, name: name!, avatar: URL(string: url!)!)
    }
  }
  
  func createMessage(content: String, name: String, avatar: URL) -> Message {
    let message = Message(withContent: content,
                          userName: name,
                          avatar: avatar)
    messages.append(message)
    return message
  }
}
