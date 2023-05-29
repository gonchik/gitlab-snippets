# Link to the recommendation: https://gitlab.com/gitlab-org/gitlab/-/issues/331033
sudo gitlab-ctl stop sidekiq
sudo gitlab-ctl stop gitlab-rails
sudo gitlab-rake gitlab:exclusive_lease:clear
sudo gitlab-ctl start gitlab-rails
sudo gitlab-ctl start sidekiq

# for sidekiq instance
# gitlab-ctl tail gitlab-rails
sudo gitlab-ctl stop sidekiq
sudo gitlab-rake gitlab:exclusive_lease:clear
sudo gitlab-ctl start sidekiq