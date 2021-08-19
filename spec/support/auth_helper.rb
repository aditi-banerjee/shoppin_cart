puts "Loading AuthHelper..."

module AuthHelper
  def setup_current_user
    user = User.find 1
    controller.instance_variable_set(:@current_user, user)
  end
end
