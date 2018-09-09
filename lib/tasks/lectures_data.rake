namespace :lectures_data do
  desc "Insert lectures data on DB"
  task insert_lectures: :environment do
    Lecture.create(name: 'Empreendedorismo e startups', speaker: 'Daniel Ikenaga', turn: 'day', day: 10)
    Lecture.create(name: 'Liderança Colaborativa e Gestão emocional', speaker: 'Ricardo Moraes', turn: 'day', day: 10)
    # ver com patrocinador
    Lecture.create(name: 'Carreira front-end com React', speaker: 'Bruno Dahora', turn: 'day', day: 10)
    #------------------------- fim dia 1------------------------------------
    Lecture.create(name: 'Empreendedorismo e startups', speaker: 'Daniel Ikenaga', turn: 'night', day: 10)
    Lecture.create(name: 'Construindo produtos amáveis', speaker: 'Igor', turn: 'night', day: 10)
    Lecture.create(name: 'Farmacologia tecnológica', speaker: 'Fernando', turn: 'night', day: 10)
    Lecture.create(name: 'Docker AWS', speaker: 'Pedro', turn: 'night', day: 10)
    #------------------------- fim noite 1------------------------------------
    Lecture.create(name: 'Software Livre, Debian', speaker: 'Paulo Santana', turn: 'day', day: 11)
    Lecture.create(name: 'NodeJS, do nada à alguma coisa', speaker: 'Matheus Donizete', turn: 'day', day: 11)
    Lecture.create(name: 'O que eu faço hoje pra empreender amanhã?', speaker: 'Cirineu Junior', turn: 'day', day: 11)
    # machine learning walmes
    #------------------------- fim dia 2------------------------------------
    Lecture.create(name: 'Como a Indústria 4.0 afeta o futura das organizações e das pessoas?', speaker: 'Juliano Simões', turn: 'night', day: 11)
    Lecture.create(name: 'Outsystems FALTA NOME MELHOR', speaker: 'Eduardo Andrade', turn: 'night', day: 11)
    Lecture.create(name: 'Data Science e Big Data: qual é o limite?', speaker: 'Walter Horing', turn: 'night', day: 11)
    Lecture.create(name: 'Tech Ladies FALTA NOME MELHOR', speaker: 'FALTA NOME PALESTRANTE', turn: 'night', day: 11)
    #------------------------- fim noite 2------------------------------------
    Lecture.create(name: 'UX/UI 10 Heurísticas de Nielsen', speaker: 'Carlos Correa', turn: 'day', day: 12)
    Lecture.create(name: 'Como a Indústria 4.0 afeta o futura das organizações e das pessoas?', speaker: 'Juliano Simões', turn: 'day', day: 12)
    Lecture.create(name: 'Polícia Científica - O trabalho de uma Cientista da computação na polícia', speaker: 'Sandra Balthazar', turn: 'day', day: 12)
    Lecture.create(name: 'Aplicação Mobile na Nuvem', speaker: 'Eduardo Maia', turn: 'day', day: 12)
    #------------------------- fim dia 3------------------------------------
    Lecture.create(name: 'Cultura do Desenvolvimento', speaker: 'Maurício do Couto Pelissari', turn: 'night', day: 12)
    Lecture.create(name: 'Mobile FALTA NOME MELHOR', speaker: 'Cleiton Felipe', turn: 'night', day: 12)
    Lecture.create(name: 'Blockchain #1', speaker: 'André Ferreira', turn: 'night', day: 12)
    Lecture.create(name: 'Blockchain #2', speaker: 'Rafael Capaci', turn: 'night', day: 12)
    #------------------------- fim noite 3------------------------------------
    Lecture.create(name: 'Como ir do 1º ao 10º milhão', speaker: 'Nilson Filatieri', turn: 'day', day: 13)
    Lecture.create(name: 'Blockchain e Novos caminhos econômicos', speaker: 'João Lyra', turn: 'day', day: 13)
    Lecture.create(name: 'Ruby on Rails', speaker: 'Douglas André', turn: 'day', day: 13)
    Lecture.create(name: 'Tech Ladies FALTA NOME MELHOR', speaker: 'Samara', turn: 'day', day: 13)
    #------------------------- fim dia 4 -------------------------------------
    Lecture.create(name: 'Ruby on Rails', speaker: 'Douglas André', turn: 'night', day: 13)
    Lecture.create(name: 'Diga SIM para a vida!', speaker: 'Andrea Moreira', turn: 'night', day: 13)
    Lecture.create(name: 'Atomic Design e a componentização de interfaces', speaker: 'Fernando', turn: 'night', day: 13)
    # ta la que é easter egg mas n sei o que é

  end

end
