class Doctor

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select {|app| app.doctor == self}
    end

    def new_appointment(patient, date)
        app = Appointment.new(date, patient, self)
        @@all << app
        app
    end

    def patients
        appointments.collect {|app| app.patient}
    end

end