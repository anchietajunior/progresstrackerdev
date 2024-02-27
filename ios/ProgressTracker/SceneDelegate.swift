import Turbo
import Strada
import WebKit
import TurboNavigator
import UIKit

let baseURL = Endpoint.rootURL

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private lazy var navigationController = UINavigationController()

    private lazy var turboNavigator = TurboNavigator(delegate: self, pathConfiguration: pathConfiguration)
    private lazy var pathConfiguration = PathConfiguration(sources: [
        .server(Endpoint.pathConfigurationURL)
    ])

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window!.rootViewController = navigationController
        
        UINavigationBar.configureWithOpaqueBackground()

        self.window = UIWindow(windowScene: windowScene)
        self.window?.makeKeyAndVisible()
        
        configureStrada()

        self.window?.rootViewController = self.turboNavigator.rootViewController
        self.turboNavigator.route(baseURL)
    }
    
    private func configureStrada() {
        let stradaSubstring = Strada.userAgentSubstring(for: BridgeComponent.allTypes)
        TurboConfig.shared.userAgent += " " + stradaSubstring
        
        TurboConfig.shared.makeCustomWebView = { config in
            let webView = WKWebView(frame: .zero, configuration: config)
            webView.uiDelegate = self
            
            Bridge.initialize(webView)
            return webView
        }
    }
}

// Allow Turbo to receive a custom WebViewController
extension SceneDelegate: TurboNavigationDelegate {
    func handle(proposal: VisitProposal) -> ProposalResult {
        let webViewController = WebViewController(url: proposal.url)
        return .acceptCustom(webViewController)
    }
}

// Add opaque configuration to UINavigationBar
extension UINavigationBar {
    static func configureWithOpaqueBackground() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        appearance().scrollEdgeAppearance = navigationBarAppearance
    }
}

extension SceneDelegate: WKUIDelegate {
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Confirm", style: .destructive) { _ in
            completionHandler(true)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
            completionHandler(false)
        })
        navigationController.present(alert, animated: true)
    }
}
