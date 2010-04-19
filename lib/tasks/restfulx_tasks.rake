# if the gem is not installed system wide, we'll just skip the tasks
require 'rubygems'

begin
  # this will load the tasks from bundled restfulx plugin
  require File.join(RAILS_ROOT, 'vendor/plugins/restfulx/lib', 'restfulx/active_record_tasks')
rescue LoadError
  puts "Could not load active_record_tasks from 'restfulx/active_record_tasks'. " <<
    "If you are loading restfulx gem from vendor/gems, adjust the path to active_record_tasks in " <<
    "lib/tasks/restfulx_tasks.rake accordingly."
end
