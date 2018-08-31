Registration.create(name: "Filipe Fenrich Niespodzinski", grr: "GRR20176328", cpf: "10579101983", email: "foolemdev@gmail.com")

lectures = ["Blockchain", "React", "Gatos SA", "Empreendedorismo"]
speakers = ["André João", "Carlos Emanuel", "Filepe Dahora", "Gugu Gaitero"]

6.times do
  Lecture.create(name: lectures.sample, speaker: speakers.sample, duration_in_minutes: 50)
  Course.create(name: lectures.sample, speaker: speakers.sample, duration_in_minutes: 50, vacancies: 40)
end
