module IControl::LocalLB
  ##
  # The Rule interface enables you to manipulate a local load balancer's rules. For example,
  # use the Rule interface to get a list of all rules, create rules, delete rules, modify
  # rules, and query rules.
  class Rule < IControl::Base

    set_id_name "rule_names"

    class RuleDefinition < IControl::Base::Struct; end
    class RuleStatisticEntry < IControl::Base::Struct; end
    class RuleStatistics < IControl::Base::Struct; end
    class RuleDefinitionSequence < IControl::Base::Sequence ; end
    class RuleStatisticEntrySequence < IControl::Base::Sequence ; end    ##
    # Creates this rule.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    # @param [Hash] opts
    # @option opts [IControl::LocalLB::Rule::RuleDefinition] :rules The rules to create.
    def create(opts)
      opts = check_params(opts,[:rules])
      super(opts)
    end

    ##
    # Deletes all user-defined rule.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def delete_all_rules
      super
    end

    ##
    # Deletes this rule. An exception will be raised when attempting to delete a default
    # system rule.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def delete_rule
      super
    end

    ##
    # Gets the statistics for all the rule.
    # @rspec_example
    # @return [RuleStatistics]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def all_statistics
      super
    end

    ##
    # Gets a list of all rule.
    # @rspec_example
    # @return [String]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def list
      super
    end

    ##
    # Gets the statistics for this rule.
    # @rspec_example
    # @return [RuleStatistics]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def statistics
      super
    end

    ##
    # Gets the version information for this interface.
    # @rspec_example
    # @return [String]
    def version
      super
    end

    ##
    # Modifies this rule.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    # @param [Hash] opts
    # @option opts [IControl::LocalLB::Rule::RuleDefinition] :rules The rules to modify.
    def modify_rule(opts)
      opts = check_params(opts,[:rules])
      super(opts)
    end

    ##
    # Queries all rule.
    # @rspec_example
    # @return [RuleDefinition]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def query_all_rules
      super
    end

    ##
    # Queries this rule.
    # @rspec_example
    # @return [RuleDefinition]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def query_rule
      super
    end

    ##
    # Resets the statistics for this rule.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def reset_statistics
      super
    end

    ##
    # A struct that describes the rule and its definition.
    # @attr [String] rule_name The rule name.
    # @attr [String] rule_definition The rule text/definition.
    class RuleDefinition < IControl::Base::Struct
      icontrol_attribute :rule_name, String
      icontrol_attribute :rule_definition, String
    end

    ##
    # A struct that describes statistics for a particular rule.
    # @attr [String] rule_name The rule name.
    # @attr [String] event_name The rule event name.
    # @attr [Numeric] priority The rule execution priority.
    # @attr [IControl::Common::StatisticSequence] statistics The statistics for the rule.
    class RuleStatisticEntry < IControl::Base::Struct
      icontrol_attribute :rule_name, String
      icontrol_attribute :event_name, String
      icontrol_attribute :priority, Numeric
      icontrol_attribute :statistics, IControl::Common::StatisticSequence
    end

    ##
    # A struct that describes pool statistics and timestamp.
    # @attr [IControl::LocalLB::Rule::RuleStatisticEntrySequence] statistics The statistics for a sequence of pools.
    # @attr [IControl::Common::TimeStamp] time_stamp The time stamp at the time the statistics are gathered.
    class RuleStatistics < IControl::Base::Struct
      icontrol_attribute :statistics, IControl::LocalLB::Rule::RuleStatisticEntrySequence
      icontrol_attribute :time_stamp, IControl::Common::TimeStamp
    end


    ## A sequence of rule definitions.
    class RuleDefinitionSequence < IControl::Base::Sequence ; end
    ## A sequence of Rule statistics.
    class RuleStatisticEntrySequence < IControl::Base::Sequence ; end
  end
end
