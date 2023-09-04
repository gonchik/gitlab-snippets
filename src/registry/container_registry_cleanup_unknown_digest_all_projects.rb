# To remove image tags with null size
# run the following commands in the GitLab Rails console:


projects = Project.all

projects.each do |project|
  # Loop through each container repository
  project.container_repositories.find_each do |container_repo|
    container_repo.tags.each do |tag|
      if tag.total_size == nil
        puts "Removing tag with null size - " + tag.name
        container_repo.delete_tag_by_name(tag.name)
      end
    end
  end
end 