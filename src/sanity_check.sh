echo "remove weekly basis orphaned artifacts"
sudo gitlab-rake gitlab:cleanup:orphan_job_artifact_files DRY_RUN=false > orphan_job_artifact_files.txt
ech "remove orphaned LFS files"
sudo gitlab-rake gitlab:cleanup:orphan_lfs_files > orphan_lfs_files.txt
echo "remove project uploads"
sudo gitlab-rake gitlab:cleanup:project_uploads > project_uploads.txt
echo ""
sudo gitlab-rake gitlab:doctor:secrets > doctor_secrets.txt