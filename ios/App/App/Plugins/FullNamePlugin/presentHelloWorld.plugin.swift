import Foundation
import Capacitor
import SwiftUI

@objc(FullNamePlugin)
public class FullNamePlugin: CAPPlugin {

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": "hi"
        ])
    }

    @objc func getFullName(_ call: CAPPluginCall) {
        let firstName = call.getString("firstName") ?? ""
        let lastName = call.getString("lastName") ?? ""

        call.resolve([
            "value": "\(firstName) \(lastName)"
        ])
    }
    
    @objc func presentHelloWorld(_ call: CAPPluginCall) {
        let fullName = call.getString("fullName") ?? ""
        
        guard let bridge = self.bridge else {return}
        DispatchQueue.main.async {
            let viewController = UIHostingController(rootView: HelloWorldView(fullName: fullName, call: call));
            self.bridge?.viewController?.present(viewController, animated: true, completion: nil)
            
        }
        
        
    }
}

struct HelloWorldView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var fullName: String
    var call: CAPPluginCall
    
    func onSubmit() -> Void {
        call.resolve([
            "value": textEntered,
        ])
        self.presentationMode.wrappedValue.dismiss()
    }
    
    @State private var textEntered: String = ""
    
    var body: some View {
        Text("Hello \(fullName)")
        
        TextField(
            "Enter Text",
            text: $textEntered
        )
        
        Button("Submit", action: onSubmit)
        
        
    }
}
