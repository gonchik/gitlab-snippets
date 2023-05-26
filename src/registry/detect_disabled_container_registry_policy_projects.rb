# To find all projects with disable container policy
# and project_tatal_size > 10GB

projects_and_size = [["project_id", "creator_id", "registry_size_bytes", "project_path"]]

projects = Project.includes(:container_expiration_policy).where(container_expiration_policy: { enabled: false })

projects.each do |project|
  next unless project.container_expiration_policy&.enabled == false

  project_total_size = 0
  container_repositories = project.container_repositories

  container_repositories.each do |container_repo|
    container_repo.tags.each do |tag|
      project_total_size += tag.total_size unless tag.total_size.nil?
    end
  end

  if project_total_size > 10.gigabytes
    projects_and_size << [project.id, project.creator.id, project_total_size, project.full_path]
  end
end

# Print as comma-separated output
projects_and_size.each do |ps|
  puts ps.join(",")
end