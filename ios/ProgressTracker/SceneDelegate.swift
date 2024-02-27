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
            let semaphore = DispatchSemaphore(value: 1) // Cria um semáforo com valor 1

            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Confirm", style: .destructive) { _ in
                semaphore.wait() // Tenta diminuir o semáforo, bloqueando se o valor for 0
                completionHandler(true)
                semaphore.signal() // Aumenta o semáforo, permitindo que outro thread continue
            })
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
                semaphore.wait() // Mesmo que acima
                completionHandler(false)
                semaphore.signal() // Mesmo que acima
            })

            if let currentViewController = self.getCurrentViewController() {
                currentViewController.present(alert, animated: true, completion: nil)
            }
        }

    func getCurrentViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = viewController as? UINavigationController {
            return getCurrentViewController(navigationController.visibleViewController)
        } else if let tabBarController = viewController as? UITabBarController, let selected = tabBarController.selectedViewController {
            return getCurrentViewController(selected)
        } else if let presented = viewController?.presentedViewController {
            return getCurrentViewController(presented)
        }
        return viewController
    }
}
