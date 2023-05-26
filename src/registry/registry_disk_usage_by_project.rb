# To find the disk space used by each project, run the following in the GitLab Rails console:

projects_and_size = [["project_id", "creator_id", "registry_size_bytes", "project path"]]
# You need to specify the projects that you want to look through. You can get these in any manner.
projects = Project.last(100)

projects.each do |p|
  project_total_size = 0
  container_repositories = p.container_repositories

  container_repositories.each do |c|
    c.tags.each do |t|
      project_total_size = project_total_size + t.total_size unless t.total_size.nil?
    end
  end

  if project_total_size > 0
    projects_and_size << [p.project_id, p.creator.id, project_total_size, p.full_path]
  end
end

# print it as comma separated output
projects_and_size.each do |ps|
  puts "%s,%s,%s,%s" % ps
end