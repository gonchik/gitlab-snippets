# run all files

artifacts_deleted = 0
::Ci::JobArtifact.find_each do |artifact|
  next if artifact.file.file.exists?
  artifacts_deleted += 1
  puts "#{artifact.id}  #{artifact.file.path} is missing."
  puts "Count of identified/destroyed invalid references: #{artifacts_deleted}"
  artifact.destroy!
end
puts "Count of identified/destroyed invalid references: #{artifacts_deleted}"