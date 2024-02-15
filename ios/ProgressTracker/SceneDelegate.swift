import Turbo
import Strada
import WebKit
import TurboNavigator
import UIKit

let baseURL = Endpoint.rootURL

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private lazy var turboNavigator = TurboNavigator(delegate: self, pathConfiguration: pathConfiguration)
    private lazy var pathConfiguration = PathConfiguration(sources: [
        .server(Endpoint.pathConfigurationURL)
    ])

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

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
            Bridge.initialize(webView)
            return webView
        }
    }
}

extension SceneDelegate: TurboNavigationDelegate {
    func handle(proposal: VisitProposal) -> ProposalResult {
        let webViewController = WebViewController(url: proposal.url)
        return .acceptCustom(webViewController)
    }
}
