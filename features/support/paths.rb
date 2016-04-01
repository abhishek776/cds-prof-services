# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /^the edit event page$/
      '/events/1/edit'

    when /^the home\s?page$/
      '/'
    when /^(.*)'s home feed$/
      home_path
      
    when /Clark's profile page/
      user_path(User.find_by_first_name("Clark"))
      
    when /Bane's profile page/
      user_path(User.find_by_first_name("Bane"))
      
    when /^the explore dogs page$/
      dogs_path
    
    when /"(.*)"'s dog page/
      dog_path(Dog.find_by_name($1))
    
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
