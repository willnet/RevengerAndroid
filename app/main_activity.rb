# coding: utf-8
class MainActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    @root_layout = Android::Widget::LinearLayout.new(self)
    @root_layout.backgroundColor = Android::Graphics::Color.parseColor('#007DA0')
    @root_layout.orientation = Android::Widget::LinearLayout::VERTICAL
    @root_layout.gravity = Android::View::Gravity::CENTER_VERTICAL
    title = Android::Widget::TextView.new(self)
    title.text = 'revenger'
    title.textColor = Android::Graphics::Color::WHITE
    title.textSize = 50.0
    title.setTypeface(nil, Android::Graphics::Typeface::BOLD)
    title.gravity = Android::View::Gravity::CENTER_HORIZONTAL

    @input_name_layout = Android::Widget::LinearLayout.new(self)
    @input_name_layout.gravity = Android::View::Gravity::CENTER_HORIZONTAL

    @input_name = Android::Widget::EditText.new(self)
    @input_name.hint = 'メールアドレス'
    @input_name.width = 300
    @input_name.backgroundColor = Android::Graphics::Color::WHITE
    @input_name_layout.addView(@input_name)

    @input_password_layout = Android::Widget::LinearLayout.new(self)
    @input_password_layout.gravity = Android::View::Gravity::CENTER_HORIZONTAL

    @input_password = Android::Widget::EditText.new(self)
    @input_password.hint = 'パスワード'
    @input_password.width = 300
    @input_password.backgroundColor = Android::Graphics::Color::WHITE
    # @input_password.inputType = Android::Text::InputType::TYPE_CLASS_TEXT | Android::Text::InputType::TYPE_TEXT_VARIATION_PASSWORD
    @input_password_layout.addView(@input_password)

    submit_layout = Android::Widget::LinearLayout.new(self)
    submit_layout.gravity = Android::View::Gravity::CENTER_HORIZONTAL
    submit_button = Android::Widget::Button.new(self)
    submit_button.text = 'ログイン'
    submit_button.width = 300
    submit_button.onClickListener = self
    submit_layout.addView(submit_button)

    @root_layout.addView(title)
    @root_layout.addView(@input_name_layout)
    @root_layout.addView(@input_password_layout)
    @root_layout.addView(submit_layout)

    self.contentView = @root_layout
  end

  def onClick(parent)
    intent = Android::Content::Intent.new(self, ReviewActivity)
    intent.putExtra('email', @input_name.text.toString)
    intent.putExtra('password', @input_password.text.toString)
    startActivity(intent)
  end
end
