class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      InquirySend.send_admin_mail(@inquiry).deliver_now
      redirect_to root_path, notice: 'お問い合わせメールを送信しました。'
    else
      render :index
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :body)
  end
end
