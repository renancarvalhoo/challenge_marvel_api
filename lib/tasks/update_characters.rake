namespace :marvel do
  desc "Check if there is a new character on marvel api"
  task :update_characters do
    include Marvel::Client
    p Marvel::Client.new
  end
end

# desc "I am short, but comprehensive description for my cool task"
# task task_name: [:prerequisite_task, :another_task_we_depend_on] do
#   # All your magic here
#   # Any valid Ruby code is allowed
# end