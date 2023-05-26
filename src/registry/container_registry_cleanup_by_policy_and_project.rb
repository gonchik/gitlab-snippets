# To remove image tags by running the cleanup policy,
# run the following commands in the GitLab Rails console:

# Numeric ID of the project whose container registry should be cleaned up
P = 5327

# Numeric ID of a user with Developer, Maintainer, or Owner role for the project
# Gonchik
U = 6052

# Get required details / objects
user = User.find_by_id(U)
project = Project.find_by_id(P)
policy = ContainerExpirationPolicy.find_by(project_id: P)

# Loop through each container repository
project.container_repositories.find_each do |repo|
  puts repo.attributes
  # Start the tag cleanup
  puts Projects::ContainerRepository::CleanupTagsService.new(container_repository: repo,
                                                             current_user: user,
                                                             params: policy.attributes.except("created_at", "updated_at"))
                                                        .execute
end