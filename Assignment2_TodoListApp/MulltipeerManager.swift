//
//  MulltipeerManager.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 3/10/23.
//

import Foundation
import MultipeerConnectivity
import Combine


class MultipeerManager: NSObject, ObservableObject {
        
    var peerID: MCPeerID
    var session: MCSession
    var advertiser: MCNearbyServiceAdvertiser? // Automatically initialized to nil.
    
    var toBeShared: TodoItem?
    @Published var received: TodoItem?
    
    var delegate: TodoItemsViewModel?
    
    
    override init() {
        self.peerID = MCPeerID(displayName: UIDevice.current.name)
        self.session = MCSession(peer: self.peerID)
        super.init() // Calling initializer of parent classes to allow the framework to do its thing.
        session.delegate = self // Telling the session that this MultipeerManager class will be the receiver of new changes.
    }
    
    func requestOneTodoItem() { // "Advertising"
        // Tells nearby to devices to join this session.
        self.advertiser = MCNearbyServiceAdvertiser(peer: self.peerID, discoveryInfo: nil, serviceType: "ios-todo")
        self.advertiser?.delegate = self
        self.advertiser?.startAdvertisingPeer()
    }
    
    func setToBeShared(item: TodoItem) {
        self.toBeShared = item
        print("Item was set: \(toBeShared != nil)")
    }
    
    func share(completion: (Bool) -> Void) {
        let textDecoded = toBeShared!.text.data(using: .ascii)
        
        if session.connectedPeers.count > 0 {
            do {
                print("Sending '\(toBeShared!.text)' as \(textDecoded!).")
                try session.send(textDecoded!, toPeers: session.connectedPeers, with: .reliable)
                print("Data was sent!")
                completion(true) // -> Something good happened
            } catch {
                print("Text data was bad!")
                completion(false) // Something bad happened
            }
        }

    }
    
    func listRequesters() {
        let browserView = MCBrowserViewController(serviceType: "ios-todo", session: self.session)
        browserView.delegate = self
        UIApplication.shared.windows.first?.rootViewController?.present(browserView, animated: true)
        // Will display list of users to send to.
    }
    
}

// Telling our class to also implement the MCSessionDelegate protocol.
extension MultipeerManager: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
            print("Connected.")
        case .notConnected:
            print("Not connected")
        case .connecting:
            print("Connecting.....")
        
        @unknown default:
            print("unkown error")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
        print("Data received: \(data)")
        
        let textDecoded = String(data: data, encoding: .ascii)
        
        print("Data received as String: \(textDecoded!)")
        
        received = TodoItem(text: textDecoded!)
        
        print("Data was set locally.")
                        
        session.disconnect()
        self.advertiser?.stopAdvertisingPeer() // Stop advertising upon receiving data.
        
        // Append data when data is received:
        
        delegate!.appendItem(item: received!)
        
         
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
    
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    

}

extension MultipeerManager: MCNearbyServiceAdvertiserDelegate {
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        
        // The requester accepts the invitation (the received todo item) by sender:
        
        invitationHandler(true, self.session)
    }
    
    
}

extension MultipeerManager: MCBrowserViewControllerDelegate {
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true)
        
        // If connected to the other user:
        print("Shared is nil: \(toBeShared == nil)")
        share { success in     // share your todoItem
            print("Is success: \(success)")
        }
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true)
    }
    
    
}
