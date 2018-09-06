# Registration.create(name: "Filipe Fenrich Niespodzinski", grr: "GRR20176328", cpf: "10579101983", email: "foolemdev@gmail.com", turn: 'day')



lectures = ["Blockchain", "React", "Gatos SA", "Empreendedorismo"]
speakers = ["André João", "Carlos Emanuel", "Filepe Dahora", "Gugu Gaitero"]

6.times do
  lecture = lectures.sample
  speaker = speakers.sample
  Lecture.create(name: lecture, speaker: speaker, turn: 'day')
  Lecture.create(name: lecture, speaker: speaker, turn: 'night')
end

Course.create(name: "Web", speaker: "Diego Perly", vacancies: 40, time_load: 290, schedule: 'Seg e Ter - 19:00 às 20:40 e 21:00 às 21:40')
Course.create(name: "Elixir", speaker: "Pedro Correia", vacancies: 40, time_load: 100, schedule: 'Qua - 19:00 às 20:40')
Course.create(name: "GIT", speaker: "Lucas Marques", vacancies: 40, time_load: 145, schedule: 'Qui - 19:00 às 20:40 e 21:00 às 21:40')
Course.create(name: "Coachs/Workshop - Descubra-se", speaker: "Andrea Eduarda", vacancies: 40, time_load: 100, schedule: 'Qui - 16:30 às 18:10')
