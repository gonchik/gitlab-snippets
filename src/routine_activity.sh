# remove weekly basis orphaned artifacts
sudo gitlab-rake gitlab:cleanup:orphan_job_artifact_files DRY_RUN=false
# remove orphaned LFS files
sudo gitlab-rake gitlab:cleanup:orphan_lfs_files
# remove project uploads
sudo gitlab-rake gitlab:cleanup:project_uploads
sudo gitlab-rake gitlab:doctor:secrets