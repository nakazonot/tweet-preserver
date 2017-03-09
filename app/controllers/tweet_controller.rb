class TweetController < ApplicationController

  def index
    @form = Form.new
    @form.tag = normalize_tag(params[:tag])
    if @form.valid?
      @tweets = Tweet.where(query: @form.tag)
    else
      @tweets = Tweet.all
    end
    @tweets = @tweets.page(params[:page]).per(20)
  end

  def obtain
    @form = Form.new(form_params)
    if  @form.valid?
      Tweet.new.generate_from_twitter(@form.tag, lang: "ja", result_type: "recent", count: params[:limit])
    else
      flash[:error] = "Please enter a hash_tag"
    end
    redirect_to action: :index, tag: @form.tag
  rescue => e
    logger.error e.message
    flash[:error] = "ERROR: #{e.message}"
    redirect_to action: :index, tag: @form.tag
  end

  private

    def form_params
      params[:tag] = normalize_tag(params[:tag])
      params.permit(:tag)
    end

    def normalize_tag(tag)
      return nil if tag.nil?
      "#" + tag.gsub("#", "")
    end

end

class Form
  include ActiveModel::Model
  attr_accessor :tag

  validates :tag, presence: true, length: { maximum: 30 }
end
