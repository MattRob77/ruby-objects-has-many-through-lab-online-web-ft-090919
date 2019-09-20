class Patient

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(doctor, date)
        app = Appointment.new(date, self, doctor)
        @@all << app
        app
    end

    def appointments
        Appointment.all.select {|app| app.patient == self}
    end

    def doctors
        appointments.collect {|app| app.doctor}
    end

end