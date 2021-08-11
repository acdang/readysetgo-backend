Rails.application.routes.draw do
  resources :workout_blocks
  resources :set_repetitions
  resources :workouts
  resources :blocks
  resources :exercise_sets
  resources :exercises
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/set_repetitions/reduce', to: 'set_repetitions#reduce_reps'
  post '/set_repetitions/increase', to: 'set_repetitions#increase_reps'

  post '/workout_blocks/remove', to: 'workout_blocks#remove_instance'
end
