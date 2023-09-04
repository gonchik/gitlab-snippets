# To remove image tags with null size by project ,
# run the following commands in the GitLab Rails console:

# Numeric ID of the project whose container registry should be cleaned up
P = 3733

project = Project.find_by_id(P)

# Loop through each container repository
project.container_repositories.find_each do |container_repo|
  container_repo.tags.each do |tag|
    if tag.total_size == nil
      puts "Removing tag with null size - " + tag.name
      container_repo.delete_tag_by_name(tag.name)
    end
  end
end