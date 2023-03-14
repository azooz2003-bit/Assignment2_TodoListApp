//
//  MultipeerManager.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 3/14/23.
//

import Foundation
import MultipeerConnectivity

class MultipeerManager: ObservableObject {
    
    var peerID: MCPeerID
    var session: MCSession
    var advertiser: MCNearbyServiceAdvertiser?
    
    var toBeShared: TodoItem? // ANY SHARED ITEM
    @Published var received: TodoItem? // ANY RECEIVED ITEM
    
    var delegate: TodoItems?
    
    override init() {
        peerID = MCPeerID(displayName: UIDevice.current.name)
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        super.init()
        session.delegate = self
    }
    
    // Advertiser:
    func requestTodoItem() {
        self.advertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: "gt-ios-guess-e")
        advertiser?.delegate = self
        advertiser?.startAdvertisingPeer()
    }
    
    func setToBeShared(item: TodoItem) { //
        self.toBeShared = item
        print("Item was set: \(toBeShared != nil)")
    }
    
    
    func share(completion: (Bool) -> Void) {
        let decodedText: Data = toBeShared?.text.data(using: .utf8) // As Data()
        
        
        if (session.connectedPeers.count() > 0) {
            
            try {
                session.send(decodedText, toPeers: session.connectedPeers, with: .reliable)
                print("Data was sent!")
                completion(true) // = SUCCESS
            } catch {
                completion(false)// = FAILURE
            }
        }

    }
    
    
    func listRequesters() {
        var browser = MCBrowserViewController(serviceType: "gt-ios-guess-e", session: self.session)
        browser.delegate = self
        UIApplication.shared.windows.first?.rootViewController?.present(browserView, animated: true)
    }
    
    
    

    
}

extension MultipeerManager: MCSessionDelegate {
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .notConnected:
            print("Not connected!")
        case .connecting:
            print("Connecting!")
        case .connected:
            print("Connected!")
        default:
            print("Unknown")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
    
        let textDecoded = String(data: data, encoding: .ascii)
       
        print("Data received as String: \(textDecoded!)")
       
        self.received = TodoItem(text: textDecoded!)
       
       print("Data was set locally.")
                       
       session.disconnect()
       self.advertiser?.stopAdvertisingPeer() // Stop advertising upon receiving data.
       
       // Append data when data is received:
       
        // TodoItems
       delegate!.appendItem(item: received!)
        
    }
        
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
    
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }

    
}

extension MultipeerManager: MCBrowserViewControllerDelegate {
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true)
        
        // If connected to the other user:
        print("Shared is nil: \(toBeShared == nil)")
        share() { success in     // share your todoItem
            print("Is success: \(success)")
        }
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true)
    }
    
    
}


extension MultipeerManager: MCNearbyServiceAdvertiserDelegate {
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        
        
        invitationHandler(true, self.session)
        
    }
    
}
