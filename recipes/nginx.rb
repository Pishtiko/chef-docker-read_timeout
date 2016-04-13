docker_service 'default' do
  action [:create, :start]
end

file '/tmp/test.conf' do
  content '# test'
  notifies :restart, 'docker_container[nginx]'
end

docker_image 'nginx' do
  tag 'latest'
  action :pull
  notifies :redeploy, 'docker_container[nginx]'
end

docker_container 'nginx' do
  repo 'nginx'
  tag 'latest'
  subscribes :run_if_missing, 'docker_service[default]'
end
