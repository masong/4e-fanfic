module ApplicationHelper
  def username 
    if @username == nil and request.env['HTTP_VERIFIED'] == 'SUCCESS'
      @username = request.env['HTTP_DN'].split('/')[-1][13..-9]
    end
  end
end
