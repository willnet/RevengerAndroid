class ErrorListener
  attr_accessor :activity

  def initialize(activity)
    @activity = activity
  end

  def onResponse(json)
    puts 'error!'
    puts json
  end
end
