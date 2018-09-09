f = Registration.create(name: "Filipe TESTE", grr: "GRR20176328", cpf: "10579101983", email: "foolemdev@gmail.com", turn: 'day')
hash = Hashids.new("semana academica tads 2018").encode(f.id, 6, 6, 6)
f.hash_id = hash
f.save
RegistrationMailer.send_qrcode(Registration.first).deliver

Course.create(name: "Web", speaker: "Diego Perly", vacancies: 40, time_load: 290, schedule: 'Seg e Ter - 19:00 às 20:40 e 21:00 às 21:40')
Course.create(name: "Elixir", speaker: "Pedro Correia", vacancies: 40, time_load: 100, schedule: 'Qua - 19:00 às 20:40')
Course.create(name: "GIT", speaker: "Lucas Marques", vacancies: 40, time_load: 145, schedule: 'Qui - 19:00 às 20:40 e 21:00 às 21:40')
Course.create(name: "Coachs/Workshop - Descubra-se", speaker: "Andrea Eduarda", vacancies: 40, time_load: 100, schedule: 'Qui - 16:30 às 18:10')
Course.create(name: "Desenvolvimento mobile multiplataforma com Flutter", speaker: "Jhionan Rian Lara dos Santos", vacancies: 40, time_load: 200, schedule: "Ter - 19:00 - 21:40")
