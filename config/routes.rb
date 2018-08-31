Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :registrations do
        get 'check_in/lecture/:lecture_id', to: 'registrations#check_in_lecture'
        get 'check_in/course/:course_id', to: 'registrations#check_in_course'
      end
    end
  end


  resources :registrations do
    get 'check_in/:id', to: 'registrations#check_in'
  end
end
