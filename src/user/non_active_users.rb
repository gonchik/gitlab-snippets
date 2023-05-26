# Get active users without activity last 6 month
to_be_reviewed_users = User.where(state: 'active')
to_be_inactive_users = to_be_reviewed_users.where('last_activity_on <= ?', 6.months.ago)

if to_be_inactive_users.any?
  puts "Active users who have not logged in within the last 6 months and are not blocked:"
  to_be_inactive_users.each do |user|
    if user.username.exclude?('_bot')
      puts "Username: #{user.username}"
      # Add more user details as needed
    end
  end
else
  puts "No active users found who have not logged in within the last 6 months and are not blocked."
end
