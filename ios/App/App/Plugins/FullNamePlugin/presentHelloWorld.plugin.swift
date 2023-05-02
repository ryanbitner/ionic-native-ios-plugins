import Foundation
import Capacitor
import SwiftUI

@obj func presentView(_ call: CAPPluginCall) {
        guard let bridge = self.bridge else {return}
        let customView = HelloWorldView()
        DispatchQueue.main.async {
            self.bridge?.viewController.present(customView, animated: true, completion: nil)
        }
        call.resolve
    }



struct HelloWorldView: View {
    var body: some View {
        Text("Hello World")
    }
}