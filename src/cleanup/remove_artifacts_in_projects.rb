# List(array) of projects we want to purge artifacts from
dry_run = true
gitlab_projects = [ "epw/router", "wta/qaa/qaa-wl-wta-api-tests" ]
gitlab_projects.find_all do |cur_proj|
  p = Project.find_by_full_path(cur_proj)
  artifacts = Ci::JobArtifact.where(project: p)

  list = artifacts.order(size: :desc).each do |artifact|
    puts "Job ID: #{artifact.job_id} - Size: #{artifact.size}b - Type: #{artifact.file_type} - Created: #{artifact.created_at} - File loc: #{artifact.file}"
    if dry_run == false
      artifact.destroy!
    end
  end
end