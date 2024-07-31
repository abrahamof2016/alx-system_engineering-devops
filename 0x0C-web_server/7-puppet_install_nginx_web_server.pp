# Install and configure an Nginx server using puppet instead of
# Bash.
# You should also include resources in your manifest to perform a 301 redirect
# with querying /redirect_me
package { 'nginx':
ensure => installed,
}

file_line { 'aaaaa':
ensure => 'present',
path   => '/etc/nginx/sites-available/default',
after  => 'listen 80 default_server;',
line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

file { '/var/www/html/index.html':
content => 'Hello World!',
}

service { 'nginx':
ensure  => running,
require => package['nginx'],
}
