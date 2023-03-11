//
//  MulltipeerManager.swift
//  Assignment2_TodoListApp
//
//  Created by Abdulaziz Albahar on 3/10/23.
//

import Foundation
import MultipeerConnectivity


class MultipeerManager: NSObject, ObservableObject {
    
    var peerID: MCPeerID
    var session: MCSession
    var advertiser: MCNearbyServiceAdvertiser? // Automatically initialized to nil.
    
    
    override init() {
        self.peerID = MCPeerID(displayName: UIDevice.current.name)
        self.session = MCSession(peer: self.peerID)
        super.init() // Calling initializer of parent classes to allow the framework to do its thing.
        session.delegate = self // Telling the session that this MultipeerManager class will be the receiver of new changes.
    }
    
    func host() { // "Advertising"
        // Tells nearby to devices to join this session.
        self.advertiser = MCNearbyServiceAdvertiser(peer: self.peerID, discoveryInfo: nil, serviceType: "ios-todo")
        self.advertiser?.delegate = self
        self.advertiser?.startAdvertisingPeer()
    }
    
    func share(item: TodoItem) {
        let textDecoded = item.text.data(using: .ascii)
        
        if session.connectedPeers.count > 0 {
            do {
                try session.send(textDecoded!, toPeers: session.connectedPeers, with: .reliable)
            } catch {
                print("Text data was bad!")
            }
        }

    }
    
    func joinSession() {
        let browserView = MCBrowserViewController(serviceType: "ios-todo", session: self.session)
        browserView.delegate = self
        UIApplication.shared.windows.first?.rootViewController?.present(browserView, animated: true)
        // Will display list of users to send to.
    }
    
}

// Telling our class to also implement the MCSessionDelegate protocol.
extension MultipeerManager: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        let dataDecoded = String(data: data, encoding: .ascii)
        // Append data
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
    
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    

}

extension MultipeerManager: MCNearbyServiceAdvertiserDelegate {
    
    // This function will be automatically called when a nearby device attempts to join:
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        
        
        invitationHandler(true, self.session)
    }
    
    
}

extension MultipeerManager: MCBrowserViewControllerDelegate {
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        
    }
    
    
}
