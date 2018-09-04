Registration.create(name: "Filipe Fenrich Niespodzinski", grr: "GRR20176328", cpf: "10579101983", email: "foolemdev@gmail.com", turn: 'day')

lectures = ["Blockchain", "React", "Gatos SA", "Empreendedorismo"]
speakers = ["André João", "Carlos Emanuel", "Filepe Dahora", "Gugu Gaitero"]

6.times do
  lecture = lectures.sample
  speaker = speakers.sample
  Lecture.create(name: lecture, speaker: speaker, turn: 'day')
  Lecture.create(name: lecture, speaker: speaker, turn: 'night')
  Course.create(name: lectures.sample, speaker: speakers.sample, vacancies: 40, time_load: 120)
end
