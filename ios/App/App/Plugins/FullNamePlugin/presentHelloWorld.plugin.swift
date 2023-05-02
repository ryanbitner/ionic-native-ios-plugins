import Foundation
import Capacitor

@objc(PresentHelloWorldPlugin)
public class PresentHelloWorldPlugin: CAPPlugin {
    private let implementation = PresentHelloWorld()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @obj func presentView(_ call: CAPPluginCall) {
        guard let bridge = self.bridge else {return}
        let customView = HelloWorldView()
        DispatchQueue.main.async {
            self.bridge?.viewController.present(customView, animated: true, completion: nil)
        }
        call.resolve
    }
}
