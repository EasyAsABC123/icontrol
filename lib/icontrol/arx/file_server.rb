module IControl::ARX
  ##
  # The FileServer Interface lets applications retrieve ARX file server information.
  class FileServer < IControl::Base

    set_id_name "fileservers"

    ##
    # Returns a list of file server definitions for this file servers.
    # @rspec_example
    # @return [FileServerDefinition]
    def definition
      super
    end

    ##
    # Returns the list of file server names.
    # @rspec_example
    # @return [String]
    def list
      super
    end


  end
end
