class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #rescue_from ActiveRecord::StaleObjectError do |exception|
  #  correct_stale_record_version
  #  stale_record_recovery_action
  #end

  #rescue_from Exception, with: :show_errors

  private
  def show_errors( exception )
    flash[ :error ] = 'Es ist ein Fehler aufgetreten!'
    flash[ :error_message ] = exception.message
    flash[ :error_details ] = exception.inspect
    flash[ :error_stacktrace ] = exception.backtrace[0..5].to_s
    redirect_to start_overview_url
  end

  #def stale_record_recovery_action
  #  flash.now[:error] = "Ein anderer Anwender hat den Datensatz bereits geändert." +
  #                      "Ihre Änderungen können leider nicht gespeichert werden."
  #  render :edit, :status => :conflict
  #end

end
