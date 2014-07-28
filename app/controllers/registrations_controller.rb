class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
    # TODO: Refactor me!
    if account_type_params[:account_type] == "Student"
      resource.student = Student.create
    else
      resource.teacher = Teacher.create
    end
    if resource.save
      set_flash_message :notice, :signed_up if is_flashing_format?
      sign_up(resource_name, resource)
      respond_with resource, location: after_sign_up_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def account_type_params
    params.permit(:account_type)
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

end