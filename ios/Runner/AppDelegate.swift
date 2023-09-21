import UIKit
import Flutter

// UIApplicationMain属性を持つAppDelegateクラスを宣言します。
@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
     // アプリケーションが起動するときに呼び出される関数です。
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Flutterプラグインを登録して初期化します。
        GeneratedPluginRegistrant.register(with: self)
        // iOSとFlutterの間で通信するためのメソッドチャネルを設定します。
        setiOSChannel();
        // スーパークラスのメソッドを呼び出してアプリケーションの起動を続行します。
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    // iOSとFlutterの間で通信するためのメソッドチャネルを設定します。
    func setiOSChannel() {
        // Flutterのビューコントローラを取得します。
        let controller : FlutterViewController = self.window?.rootViewController as! FlutterViewController
        // メソッドチャネルを初期化し、メソッド呼び出しのハンドラを設定します。
        let channel = FlutterMethodChannel.init(name: "com.sample.sample/sample", binaryMessenger: controller.binaryMessenger)
        channel.setMethodCallHandler({
            (call, result) -> Void in
            // Flutter側から"sample"メソッドが呼び出された場合の処理です。
            if call.method == "sample" {
                // "SampleViewController"というStoryboardからビューコントローラを作成し、表示します。
                let nextController = controller.storyboard?.instantiateViewController(withIdentifier: "SampleViewController")
                controller.present(nextController!, animated: true, completion: nil)
            }
        })
    }
}
