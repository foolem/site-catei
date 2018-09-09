Rails.application.routes.draw do
  root 'registrations#index'
  get "/404" => "errors#not_found"
  get "/500" => "errors#exception"

  mount_devise_token_auth_for 'Staff', at: 'api/v1/auth'

  namespace :api do
    namespace :v1 do
      resources :registrations, path: 'participantes', except: [:edit, :update, :destroy] do
        get 'check_in/palestra/:lecture_id', to: 'registrations#check_in_lecture'
        get 'check_in/curso/:course_id', to: 'registrations#check_in_course'
      end
      resources :lectures, path: 'palestras', only: [:index, :show]
      resources :courses, path: 'cursos', only: [:index, :show]
    end
  end

  scope(path_names: { new: 'novo', edit: 'editar' }) do
    resources :registrations, path: 'participantes', except: [:edit, :show, :update, :destroy] do
    end
  end

  #get 'certificados', to: 'registrations#certificates'

  get 'busca', to: 'registrations#registration_courses', as: 'registration_courses'
  post 'inscricao_cursos', to: 'registrations#participant_search'
  post 'add_course_to_participant', to: 'registrations#add_course_to_participant'
  match 'inscricao_satads/:hash', to: 'registrations#satads_confirmation', via: 'get'
  match 'inscricao_curso/:hash', to: 'registrations#courses_confirmation', via: 'get'
  match 'inscricao_cursos', to: 'registrations#registration_courses', via: 'get'
end
