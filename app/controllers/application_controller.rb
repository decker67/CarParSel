class ApplicationController < ActionController::Base

  #http_basic_authenticate_with name: "?", password: "?"

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #rescue_from ActiveRecord::StaleObjectError do |exception|
  #  correct_stale_record_version
  #  stale_record_recovery_action
  #end

  #rescue_from Exception, with: :show_errors

  private
  def mobile_device?
    request.user_agent =~ /Mobile/
  end

  helper_method :mobile_device?

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

  def addLikeFilterFor( model_attribute_name, param_name = model_attribute_name )
    session[ param_name ] = params[ param_name ] || session[ param_name ]

    if !session[ param_name ].nil? && !session[ param_name ].empty?
      filter_value = '%' + session[ param_name ] + '%'
      @like_filter[ model_attribute_name ] = filter_value
      @view_filter[ param_name ] = session[ param_name ]
    end
  end

  def addEqualFilterFor( model_attribute_name, param_name = model_attribute_name )
    #todo: add parameter to method to separate other controller parameters
    session[ param_name ] = params[ param_name ] || session[ param_name ]
    if !session[ param_name ].nil? && !session[ param_name ].empty?
      if block_given?
        filter_value = ( yield session[ param_name ] ).flatten
      else
        filter_value = session[ param_name ]
      end

      @equal_filter[ model_attribute_name ] = filter_value
      @view_filter[ param_name ] = session[ param_name ]
    end
  end

  def addYearFilterFor( param_name )
    session[ param_name ] = params[ param_name ] || session[ param_name ]
    if session[ param_name ].present?
      view_value = session[ param_name ].to_i
      start_date = Date.new( view_value, 1,1 )
      end_date = Date.new( view_value, 12, 31 )
      @equal_filter[ :date_of_construction ] = start_date..end_date
      @view_filter[ param_name ] = view_value
    end
  end

end
