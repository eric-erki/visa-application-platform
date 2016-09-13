class MessagesController < ApplicationController
  def index
    
  end
  
  def new
    @applicant = Applicant.find(params[:applicant])
  end

  def create
    m = Message.new(message_params)
    if m.save
      @m = "The message has been sent successfully"
    else
      @m = "Something wrong hapeened, please try again"
    end
    render 'bootbox.js.erb'
  end

  private
  def message_params
    params.require(:messages).permit(:applicant_id, :content)
  end
end
