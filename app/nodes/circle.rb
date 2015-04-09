class Circle < SKShapeNode
  def init
    super

    path = CGPathCreateMutable()
    CGPathAddArc(path, nil, 0, 0, 15, 0, Math::PI*2, true)
    self.path = path
    self.fillColor = SKColor.blueColor
    self.strokeColor = SKColor.whiteColor
    self.lineWidth = 1.0
    self.glowWidth = 0.5

    self
  end
end