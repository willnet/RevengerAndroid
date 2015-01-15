class ReviewActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    @root_layout = Android::Widget::LinearLayout.new(self)
    @root_layout.backgroundColor = Android::Graphics::Color.parseColor('#007DA0')
    @root_layout.orientation = Android::Widget::LinearLayout::VERTICAL
    @root_layout.gravity = Android::View::Gravity::CENTER_VERTICAL

    email = Android::Widget::TextView.new(self)
    email.text = self.intent.getStringExtra('email')

    @root_layout.addView(email)

    self.contentView = @root_layout
  end
end
