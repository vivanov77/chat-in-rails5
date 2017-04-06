# Be sure to restart your server when you modify this file.

Warden::Manager.after_set_user do |user,auth,opts|
  scope = opts[:scope]
  auth.cookies.signed["#{scope}.id"] = user.id
end

Warden::Manager.before_logout do |user, auth, opts|
  scope = opts[:scope]
  # auth.cookies.signed["#{scope}.id"] = nil
  # auth.cookies.signed["#{scope}.expires_at"] = nil
  auth.cookies.delete("#{scope}.id")
end