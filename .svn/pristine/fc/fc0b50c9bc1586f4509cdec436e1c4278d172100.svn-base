class RegistrationsController < Devise::RegistrationsController
	private
	  def sign_up_params
	    params.require(:user).permit(:id_number, :full_name, :email, :telephone, :address, :password, :password_confirmation, :signature)
	  end

	  def account_update_params
	    params.require(:user).permit(:id_number, :full_name, :email, :telephone, :address, :password, :password_confirmation, :current_password)
	  end
end