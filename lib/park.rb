class Park
    attr_accessor :full_name, :state_code, :park_id, :operating_hours, :directions, :activities, :description, :contacts
    @@all = []

    def initialize (full_name:, state_code:, park_id:)
        @full_name = full_name
        @state_code = state_code
        @park_id = park_id
        @@all << self
         
    end

    def self.all
        @@all
    end

    def self.find_by_state_code(state_code)
        self.all.select {|s| s.state_code == state_code}
    end
end