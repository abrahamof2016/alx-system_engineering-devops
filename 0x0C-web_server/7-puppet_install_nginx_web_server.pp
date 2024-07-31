# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Manage Nginx service
service { 'nginx':
  ensure => running,
  enable => true,
}

# Create Nginx configuration file
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => template('nginx/default.erb'),
}

# Enable the site
file { '/etc/nginx/sites-enabled/default':
  ensure => link,
  target => '/etc/nginx/sites-available/default',
}

# Template for Nginx configuration
template { '/etc/nginx/sites-available/default.erb':
  source => 'default.erb'
}

# Force Nginx to reload configuration
exec { 'nginx reload':
  command => '/etc/init.d/nginx reload',
  onlyif => File['/etc/nginx/nginx.conf'].modified,
}
