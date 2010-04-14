ActionController::Routing::Routes.draw do |map|
  map.resources :words

  map.resources :universes
  
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.resources :user_sessions

  map.paragraphs 'paragraphs/:num/:min', :controller => 'paragraphs', :action => 'paragraph'
  map.num_paragraphs 'paragraphs/:num', :controller => 'paragraphs', :action => 'paragraph'
  map.multiple 'paragraphs', :controller => 'paragraphs', :action => 'paragraph', :num => 3
  map.paragraph 'paragraph/:min', :controller => 'paragraphs', :action => 'paragraph'
  map.single_paragraph 'paragraph', :controller => 'paragraphs', :action => 'paragraph'
  map.single_title 'title', :controller => 'paragraphs', :action => 'title'
  map.title 'title/:num', :controller => 'paragraphs', :action => 'title'
  
  map.resources :users

  map.root :controller => "home", :action => "show"
  map.home ':page', :controller => 'home', :action => "show", :page => /index|wordlist/

end
