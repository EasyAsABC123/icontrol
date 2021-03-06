module IControl::GlobalLB
  ##
  # The DNSSECKey interface manages the cryptographic keys used for securing DNS information,
  # i.e., DNSSEC. The keys managed by this interface can be used to sign DNS record groups
  # and the keys themselves. Technically, there is not a single key for each key object.
  # This key is re-created on a regular schedule, which can be controlled via this interface.
  # Each re-generated key is considered a new &amp;quot;generation" - a term used more
  # in its genealogical sense than a creation sense. A single key generation can have
  # its lifetime changed. Thus when using this interface, be careful to distinguish the
  # attributes which apply to this whole process vs those that apply to a single key
  # generation. Once a key generation is created, it is fully active for the &amp;quot;rollover
  # period". At the end of that period, the next generation's key is created and both
  # keys are in use. Once the first key reaches the end of its &amp;quot;expiration period",
  # it is no longer handed out, the generation is deleted, and only the second key is
  # in use. This process continues ad infinitum. It is important to note that these keys
  # do not affect the processing by their mere existence. To take effect, they must be
  # assigned to a DNSSEC zone (See the DNSSECZone interface).
  class DNSSECKey < IControl::Base

    set_id_name "keys"

    class KeyAlgorithmSequence < IControl::Base::Sequence ; end
    class KeyTypeSequence < IControl::Base::Sequence ; end
    # Digital signature algorithm used to sign DNS record groups and keys
    class KeyAlgorithm < IControl::Base::Enumeration; end
    # DNSSEC key type
    class KeyType < IControl::Base::Enumeration; end    ##
    # Creates a set of DNSSEC key. Note that the attributes specified in this method cannot
    # be changed afterwards.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    # @param [Hash] opts
    # @option opts [long] :sizes Digital signature sizes (bits) for each specified key
    # @option opts [IControl::GlobalLB::DNSSECKey::KeyType] :types DNSSEC key type (See KeyType ) for each specified key
    # @option opts [IControl::GlobalLB::DNSSECKey::KeyAlgorithm] :algorithms Digital signature algorithm (See KeyAlgorithm ) for each specified key
    # @option opts [IControl::Common::EnabledState] :fips Specifies whether the FIPS device should be used for storing and retrieving the keys
    def create(opts)
      opts = check_params(opts,[:sizes,:types,:algorithms,:fips])
      super(opts)
    end

    ##
    # Deletes all DNSSEC key.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def delete_all_keys
      super
    end

    ##
    # Deletes a set of DNSSEC key.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def delete_key
      super
    end

    ##
    # Gets the algorithms used to digitally sign DNS record groups and key for a set of
    # DNSSEC key.
    # @rspec_example
    # @return [KeyAlgorithm]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def algorithm
      super
    end

    ##
    # Gets the enabled state for a set of DNSSEC key.
    # @rspec_example
    # @return [EnabledState]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def enabled_state
      super
    end

    ##
    # Gets the expiration period for a set of DNSSEC key.
    # @rspec_example
    # @return [long]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def expiration_period
      super
    end

    ##
    # Gets the enabled state for using the FIPS device to store and retrieve key for a
    # set of DNSSEC key.
    # @rspec_example
    # @return [EnabledState]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def fips_state
      super
    end

    ##
    # Gets the existing DNSSEC key generation identifiers for a set of DNSSEC key. The
    # key generation identifier is a simple generation count, unique within a single DNSSEC
    # key.
    # @rspec_example
    # @return [ULong64[]]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def generation
      super
    end

    ##
    # Gets the expiration date and time for a set of DNSSEC key generations.
    # @rspec_example
    # @return [TimeStamp[]]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    # @param [Hash] opts
    # @option opts [IControl::Common::ULong64[]] :generations Identifiers for the key generations to query for each specified DNSSEC key
    def generation_expiration_time(opts)
      opts = check_params(opts,[:generations])
      super(opts)
    end

    ##
    # Gets the public text for a set of DNSSEC key generations.
    # @rspec_example
    # @return [String[]]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    # @param [Hash] opts
    # @option opts [IControl::Common::ULong64[]] :generations Identifiers for the key generations to query for each specified DNSSEC key
    def generation_public_text(opts)
      opts = check_params(opts,[:generations])
      super(opts)
    end

    ##
    # Gets the rollover date and time for a set of DNSSEC key generations.
    # @rspec_example
    # @return [TimeStamp[]]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    # @param [Hash] opts
    # @option opts [IControl::Common::ULong64[]] :generations Identifiers for the key generations to query for each specified DNSSEC key
    def generation_rollover_time(opts)
      opts = check_params(opts,[:generations])
      super(opts)
    end

    ##
    # Gets the names of all DNSSEC key.
    # @rspec_example
    # @return [String]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def list
      super
    end

    ##
    # Gets the rollover period for a set of DNSSEC key.
    # @rspec_example
    # @return [long]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def rollover_period
      super
    end

    ##
    # Gets the RRSIG record signature publication period for a set of DNSSEC key.
    # @rspec_example
    # @return [long]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def signature_publication_period
      super
    end

    ##
    # Gets the RRSIG record signature validity period for a set of DNSSEC key.
    # @rspec_example
    # @return [long]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def signature_validity_period
      super
    end

    ##
    # Gets the digital signature sizes for a set of DNSSEC key.
    # @rspec_example
    # @return [long]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def size
      super
    end

    ##
    # Gets the Time To Live (TTL) for the DNSKEY record types.
    # @rspec_example
    # @return [long]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def time_to_live
      super
    end

    ##
    # Gets the types for a set of DNSSEC key.
    # @rspec_example
    # @return [KeyType]
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    def type
      super
    end

    ##
    # Get the version information for this interface.
    # @rspec_example
    # @return [String]
    def version
      super
    end

    ##
    # Sets the enabled state for a set of DNSSEC key. If a DNSSEC key is disabled, the
    # key is still published, but it is not used to sign DNS record groups or key.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    # @param [Hash] opts
    # @option opts [IControl::Common::EnabledState] :states Enabled state for each specified DNSSEC key (default: enabled)
    def set_enabled_state(opts)
      opts = check_params(opts,[:states])
      super(opts)
    end

    ##
    # Sets the expiration period for a set of DNSSEC key. The expiration period is the
    # time between the activation of a DNSSEC key generation and its expiration. It must
    # be longer than the rollover period.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    # @param [Hash] opts
    # @option opts [long] :times Expiration period (seconds) for each specified DNSSEC key (default: zero - never expires)
    def set_expiration_period(opts)
      opts = check_params(opts,[:times])
      super(opts)
    end

    ##
    # Sets the expiration date and time for a set of DNSSEC key generations. This method
    # can be used for any reason, but most likely used to invalidate a possibly compromised
    # key.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    # @param [Hash] opts
    # @option opts [IControl::Common::ULong64[]] :generations Identifiers for the key generations to modify for each specified DNSSEC key
    # @option opts [IControl::Common::TimeStamp[]] :times Expiration date and time for each specified DNSSEC key generation (default: as specified in the key)
    def set_generation_expiration_time(opts)
      opts = check_params(opts,[:generations,:times])
      super(opts)
    end

    ##
    # Sets the rollover date and time for a set of DNSSEC key generations. This method
    # can be used for any reason, but most likely used to invalidate a possibly compromised
    # key by forcing the creation of a new key generation.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    # @param [Hash] opts
    # @option opts [IControl::Common::ULong64[]] :generations Identifiers for the key generations to modify for each specified DNSSEC key
    # @option opts [IControl::Common::TimeStamp[]] :times Rollover date and time for each specified DNSSEC key generation (default: as specified in the key)
    def set_generation_rollover_time(opts)
      opts = check_params(opts,[:generations,:times])
      super(opts)
    end

    ##
    # Sets the rollover period for a set of DNSSEC key. The rollover period is the time
    # between the activation of one DNSSEC key generation and the activation of the next
    # DNSSEC key generation.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    # @param [Hash] opts
    # @option opts [long] :times Rollover period (seconds) for each specified DNSSEC key (default: zero - one-shot key (never rolls over))
    def set_rollover_period(opts)
      opts = check_params(opts,[:times])
      super(opts)
    end

    ##
    # Sets the RRSIG record signature publication period for a set of DNSSEC key. The signature
    # publication period is the period in which the digital signature is published, is
    # stored in the RRSIG record, and should be significantly shorter than the Time To
    # Live period and must be shorter than the signature validity period.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    # @param [Hash] opts
    # @option opts [long] :times Signature publication period (seconds) for each specified DNSSEC key (default: zero - standard BIND value)
    def set_signature_publication_period(opts)
      opts = check_params(opts,[:times])
      super(opts)
    end

    ##
    # Sets the RRSIG record signature validity period for a set of DNSSEC key. This value
    # is the period for which the digital signature is valid and is stored in the RRSIG
    # record and should be significantly smaller than the Time To Live period.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    # @param [Hash] opts
    # @option opts [long] :times Signature validity period (seconds) for each specified DNSSEC key (default: zero - standard BIND value)
    def set_signature_validity_period(opts)
      opts = check_params(opts,[:times])
      super(opts)
    end

    ##
    # Sets the Time To Live (TTL) for the DNSKEY record types.
    # @rspec_example
    # @raise [IControl::IControl::Common::AccessDenied] raised if the client credentials are not valid.
    # @raise [IControl::IControl::Common::InvalidArgument] raised if one of the arguments is invalid.
    # @raise [IControl::IControl::Common::OperationFailed] raised if an operation error occurs.
    # @param [Hash] opts
    # @option opts [long] :times DNSKEY record Time To Live (TTL) (seconds) for each specified DNSSEC key (default: 86400 (1 day))
    def set_time_to_live(opts)
      opts = check_params(opts,[:times])
      super(opts)
    end


    ## Sequence of digital signature algorithms
    class KeyAlgorithmSequence < IControl::Base::Sequence ; end
    ## Sequence of DNSSEC key types
    class KeyTypeSequence < IControl::Base::Sequence ; end
    # Digital signature algorithm used to sign DNS record groups and keys
    class KeyAlgorithm < IControl::Base::Enumeration
      # Invalid enumeration value
      KEY_ALGORITHM_UNKNOWN = :KEY_ALGORITHM_UNKNOWN
      # RSA encryption / SHA1 hash algorithm signature suite
      KEY_ALGORITHM_RSASHA1 = :KEY_ALGORITHM_RSASHA1
    end


    # DNSSEC key type
    class KeyType < IControl::Base::Enumeration
      # Invalid enumeration value
      KEY_TYPE_UNKNOWN = :KEY_TYPE_UNKNOWN
      # This key is used to sign the DNS record groups for the zone.
      KEY_TYPE_ZONE_SIGNING = :KEY_TYPE_ZONE_SIGNING
      # This key is used to sign the key information sent to upstream servers.
      KEY_TYPE_KEY_SIGNING = :KEY_TYPE_KEY_SIGNING
    end


  end
end
