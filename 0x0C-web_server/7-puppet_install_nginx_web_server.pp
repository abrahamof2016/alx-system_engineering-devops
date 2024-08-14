#  Install and configure an Nginx server using Puppet instead of Bash.
package { 'nginx':
  ensure => 'installed',
}


file { '/var/www/html/index.html':
  ensure  => 'file',
  content => 'Hello World!',
  mode    => '0644',
  require => Package['nginx'],
}

exec { 'append_redirect_me':
  command => "/usr/bin/sed -i '/server_name _/a location /redirect_me { rewrite ^ https://www.youtube.com/watch?v=QH2-TGUlw\u4? permanent; }'/
 /etc/nginx/sites-available/default"
}

service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}
