module UserHelper
  def username
    if @username == nil and request.env['HTTP_VERIFIED'] == 'SUCCESS'
      @username = request.env['HTTP_DN'].split('/')[-1][13..-9]
      return @username
    else
      return ''
    end
  end

  def is_admin?
    return username == 'mglidden'
  end

  def is_auth?
    return true
  end
end
