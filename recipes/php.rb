docker_service 'default' do
  action [:create, :start]
end

file '/tmp/test.conf' do
  content '# test'
  notifies :restart, 'docker_container[php]'
end

docker_image 'php' do
  tag 'fpm'
  action :pull
  notifies :redeploy, 'docker_container[php]'
end

docker_container 'php' do
  repo 'php'
  tag 'fpm'
  subscribes :run_if_missing, 'docker_service[default]'
end
