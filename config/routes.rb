Rails.application.routes.draw do
  mount_devise_token_auth_for 'Staff', at: 'api/v1/auth'

  get "/404" => "errors#not_found"
  get "/500" => "errors#exception"

  namespace :api do
    namespace :v1 do
      resources :registrations do
        get 'check_in/lecture/:lecture_id', to: 'registrations#check_in_lecture'
        get 'check_in/course/:course_id', to: 'registrations#check_in_course'
      end
    end
  end
  scope(path_names: { new: 'novo', edit: 'editar' }) do
    resources :registrations, path: 'participantes'
  end
  get 'cursos', to: 'registrations#registration_courses', as: 'registration_courses'
  post 'participant_search', to: 'registrations#participant_search'
  post 'add_course_to_participant', to: 'registrations#add_course_to_participant'
end
