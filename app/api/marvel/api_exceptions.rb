module Marvel
  module ApiExceptions
    MarvelApiLimitHigherExceptionError        = Class.new(ApiExceptionError)
    MarvelAPIInvalidParameterExceptionError   = Class.new(ApiExceptionError)
    MarvelAPIParameterInvalidExceptionError   = Class.new(ApiExceptionError)
    MarvelAPIEmptyParameterExceptionError     = Class.new(ApiExceptionError)
    MarvelAPITooManyValuesExceptionError      = Class.new(ApiExceptionError)
    MarvelAPIInvalidValueFilterExceptionError = Class.new(ApiExceptionError)
  end
end