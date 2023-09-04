# checking size of gitlab ci
# Ccode snippet calculates and prints the size of the .gitlab-ci.yml file
# for the specified project. It's a useful way to check the size
# of the CI configuration for a specific project,
# which can be helpful in understanding the complexity and potential impact on CI/CD pipelines.


project = Project.find_by_full_path 'platform/kitchen'

content = project.repository.gitlab_ci_yml_for(project.repository.root_ref_sha)
Gitlab::Utils::DeepSize.new(content).valid?
puts "#{project.full_path} CI size is #{ObjectSpace.memsize_of(content)} bytes"