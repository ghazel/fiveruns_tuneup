class TuneupController < ActionController::Base 

  def show
    session['fiveruns_tuneup_last_uri'] = params[:uri]
    debug_rjs = response.template.debug_rjs
    response.template.debug_rjs = false
    ActionController::Base.silence do
      render :update do |page|
        page << tuneup_reload_panel
      end
    end
    response.template.debug_rjs = debug_rjs
  end
  
  def asset
    filename = File.basename(params[:file])
    if filename =~ /css$/
      response.content_type = 'text/css'
    end
    send_file File.join(File.dirname(__FILE__) << "/../assets/#{filename}")
  end
  
  def on
    collect true
  end
  
  def off
    collect false
  end
  
  def sandbox
    
  end
  
  #######
  private
  #######
  
  def collect(state)
    Fiveruns::Tuneup.collecting = state
    render :update do |page|
      page << %[$('tuneup-panel').update("#{escape_javascript(render(:partial => 'tuneup/panel/show.html.erb'))}")]
    end
  end

end
