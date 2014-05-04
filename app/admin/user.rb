ActiveAdmin.register User do

  permit_params :name, :email, :password, :password_confirmation
  
  index do
    column :name
    column :email
    column :current_sign_in_at
    column :admin
    default_actions
  end
  
end
