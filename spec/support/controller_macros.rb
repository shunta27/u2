module ControllerMacros
  def login_user(user)
    allow(controller).to receive(:authenticate_user!).and_return(true)
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end
end