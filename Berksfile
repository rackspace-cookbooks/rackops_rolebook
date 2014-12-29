source 'https://api.berkshelf.com'
metadata

group :integration do
  cookbook 'apt'
  cookbook 'yum'
end

cookbook 'kibana', git: 'git@github.com:lusis/chef-kibana.git', branch: 'KIBANA3'

# until https://github.com/elasticsearch/cookbook-elasticsearch/pull/230
cookbook 'elasticsearch', '~> 0.3', git: 'git@github.com:racker/cookbook-elasticsearch.git'
