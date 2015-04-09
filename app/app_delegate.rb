class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    vc = ViewController.alloc.init

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = vc
    @window.makeKeyAndVisible

    true
  end
end