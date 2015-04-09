class ViewController < UIViewController
  def loadView
    v = SKView.new
    v.showsFPS = true
    v.showsNodeCount = true
    v.showsDrawCount = true

    self.view = v
  end

  def viewWillLayoutSubviews
    super

    unless self.view.scene
      scene = MainScene.alloc.initWithSize(view.bounds.size)
      scene.scaleMode = SKSceneScaleModeAspectFill
      view.presentScene(scene)
    end
  end

  def prefersStatusBarHidden
    true
  end
end