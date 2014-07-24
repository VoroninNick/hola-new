class ErrorController < ApplicationController
  def not_found
    @error_code = 404
  end

  def unacceptable
    @error_code = 422
  end

  def internal_error
    @error_code = 500
  end
end
