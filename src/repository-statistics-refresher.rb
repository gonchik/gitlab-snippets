# displayed size may

p = Project.find_by_full_path('<namespace>/<project>')
pp p.statistics
p.statistics.refresh!
pp p.statistics
# compare with earlier values

# check the total artifact storage space separately
builds_with_artifacts = p.builds.with_downloadable_artifacts.all

artifact_storage = 0
builds_with_artifacts.find_each do |build|
  artifact_storage += build.artifacts_size
end

puts "#{artifact_storage} bytes"