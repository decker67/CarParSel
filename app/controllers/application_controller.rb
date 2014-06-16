class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #rescue_from Exception, with: :show_errors

  def replace_comma( number_string )
    if !number_string.nil?
      number_string.sub!( '.', '' )
      number_string.sub!( ',', '.')
    end
  end

  def replace_decimal( number_string )
    if !number_string.nil?
      number_string.sub!( '.', ',' )
      number_string.sub!( ',', '')
    end
  end

  private
  def show_errors( exception )
    flash[ :error ] = 'Es ist ein Fehler aufgetreten!'
    flash[ :error_message ] = exception.message
    flash[ :error_details ] = exception.inspect
    flash[ :error_stacktrace ] = exception.backtrace[0..5].to_s
    redirect_to start_overview_url
  end

end
