class MainScene < SKScene
  def didMoveToView(view)
    @content_created||=begin
      add_circle
      add_pause_label

      true
    end
  end

  def add_circle
    circle = Circle.alloc.init
    circle.position = [CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)]
    circle.name = "circle"

    addChild(circle)
  end

  def add_pause_label
    label = SKLabelNode.labelNodeWithFontNamed("HelveticaNeue-UltraLight")
    label.text = "Pause"
    label.position = [CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)]
    label.name = "pause"
    label.hidden = true

    addChild(label)
  end

  def update(current_time)
    @delta = @last_update_time ?  current_time - @last_update_time : 0
    @last_update_time = current_time

    move_circle
  end

  def touchesBegan(touches, withEvent: event)
    node = childNodeWithName("pause")
    return unless node

    if self.isPaused
      self.paused = false
      node.hidden = true
    else
      self.paused = true
      node.hidden = false
    end
  end

  def move_circle

    return if self.isPaused

    node = childNodeWithName("circle")
    return unless node

    @direction||=1
    movement_amount = CGPointMake(@delta * @direction * 100.0, 0.0)
    node.position = [node.position.x + movement_amount.x, node.position.y + movement_amount.y]

    if node.position.x >= CGRectGetWidth(self.frame) or node.position.x <= 0.0
      @direction *= -1
    end

  end
end