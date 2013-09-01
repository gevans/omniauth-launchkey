require 'bundler/setup'
Bundler.require(:default)

Dotenv.load

enable :sessions

use OmniAuth::Builder do
  provider :launchkey, ENV['LAUNCHKEY_CLIENT_ID'], ENV['LAUNCHKEY_CLIENT_SECRET']
end

helpers do
  def current_user
    @current_user ||= session[:user_id]
  end
  alias current_user? current_user

  def access_token
    @access_token ||= session[:access_token]
  end

  def sign_out
    session.delete(:user_id)
    session.delete(:access_token)
    redirect "https://oauth.launchkey.com/logout?#{URI.encode_www_form(access_token: access_token, redirect: back)}"
  end
end

get '/' do
  if current_user?
    <<-HTML
    <a href="/sign_out">
      Sign Out
    </a>
    HTML
  else
    <<-HTML
    <a href="/auth/launchkey">
      <img src="https://d2882u593o0m3.cloudfront.net/resources/lklogin-blue-medium.png" />
    </a>
    HTML
  end
end

get '/auth/:provider/callback' do
  auth = request.env['omniauth.auth']
  session[:user_id] = auth.uid
  session[:access_token] = auth.credentials.token
  redirect '/'
end

get '/sign_out' do
  sign_out
end
