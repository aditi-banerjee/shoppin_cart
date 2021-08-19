class ApplicationController < ActionController::API
  before_action :authenticate!

  private
  def access_token
    @access_token ||= AccessToken.new(
      request: request,
      response: response,
      secret: Rails.application.secrets.access_token_secret,
      ttl: 3600
    )
  end

    def current_user
      @current_user
    end

    def authenticate!
      @current_user = User.find_by_id(access_token.resolve)
      return render(nothing: true, status: 401) unless current_user
      access_token.update(current_user)
    end

  def paginate_resource(resource)
    {
      data: resource,
      current_page: resource.current_page,
      next_page: resource.next_page,
      prev_page: resource.previous_page,
      total_pages: resource.total_pages,
      total_count: resource.total_entries
    }
  end
end
