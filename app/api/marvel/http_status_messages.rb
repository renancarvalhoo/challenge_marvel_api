module Marvel
  module HttpStatusMessages
    LIMIT_GREATER_THAN_100                     = 'Limit greater than 100.'.freeze
    LIMIT_INVALID_OR_BELOW_1                   = 'Limit invalid or below 1.'.freeze
    INVALID_OR_UNRECOGNIZED_PARAMETER          = 'Invalid or unrecognized parameter.'.freeze
    EMPTY_PARAMETER                            = 'Empty parameter.'.freeze
    INVALID_OR_UNRECOGNIZED_ORDERING_PARAMETER = 'Invalid or unrecognized ordering parameter.'.freeze
    TOO_MANY_VALUES_MULTI_VALUE_LIST_FILTER    = 'Too many values sent to a multi-value list filter.'.freeze
    INVALID_FILTER_VALUE                       = 'Invalid value passed to filter.'.freeze
  end
end