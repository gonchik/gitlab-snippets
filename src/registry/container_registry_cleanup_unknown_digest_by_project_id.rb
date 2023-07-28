# To remove image tags by running the cleanup policy,
# run the following commands in the GitLab Rails console:

# Numeric ID of the project whose container registry should be cleaned up
P = 3733

# Numeric ID of a user with Developer, Maintainer, or Owner role for the project
# Gonchik Tsymzhitov
U = 6052

# Get required details / objects
user = User.find_by_id(U)
project = Project.find_by_id(P)

# Loop through each container repository
project.container_repositories.find_each do |container_repo|
  container_repo.tags.each do |t|
    if t.total_size == nil
      puts "Removing tag with null size - " + t.name
      container_repo.delete_tag_by_name(t.name)
    end
  end
end