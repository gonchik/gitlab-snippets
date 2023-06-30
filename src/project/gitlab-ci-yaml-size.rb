# checking size of gitlab ci
project = Project.find_by_full_path 'platform/kitchen'
content = project.repository.gitlab_ci_yml_for(project.repository.root_ref_sha)
Gitlab::Utils::DeepSize.new(content).valid?
puts "#{project.full_path} CI size is #{ObjectSpace.memsize_of(content)} bytes"