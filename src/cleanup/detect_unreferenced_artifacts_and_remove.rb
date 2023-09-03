# run all files
# script for cleaning up invalid references to job artifacts in a GitLab instance.
# This script can be useful in cases where there might be inconsistencies
# between the database records and the actual files stored on disk.
# It helps clean up and maintain the integrity of the GitLab instance's database.

artifacts_deleted = 0
::Ci::JobArtifact.find_each do |artifact|
  next if artifact.file.file.exists?
  artifacts_deleted += 1
  puts "#{artifact.id}  #{artifact.file.path} is missing."
  puts "Count of identified/destroyed invalid references: #{artifacts_deleted}"
  artifact.destroy!
end
puts "Count of identified/destroyed invalid references: #{artifacts_deleted}"