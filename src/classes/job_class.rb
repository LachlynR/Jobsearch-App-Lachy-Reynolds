require_relative '../functions'

class Job

    attr_accessor :position, :employer, :industry, :progress, :application_date, :notes

    def initialize(position, employer, industry, progress, application_date, notes)
        @position = position
        @employer = employer
        @industry = industry
        @progress = progress
        @application_date = application_date
        @notes = notes
    end
end