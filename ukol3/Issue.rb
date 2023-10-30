class Issue
    private
    @title
    @status
    @priority
    
    public
    def initialize(title, status: :new, priority: :medium)
        @title = title
        
        raise "Incorrect status" unless [:new, :progress, :done].include? status
        @status = status 
        
        raise "Incorrect priority" unless [:low, :medium, :high].include? priority
        @priority = priority
    end

    def title
        @title
    end

    def status
        @status
    end

    def status=(status)
        @status = status
    end

    def priority
        @priority
    end

    def priority=(priority)
        @priority = priority
    end

end
