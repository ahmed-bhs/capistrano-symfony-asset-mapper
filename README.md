# **Capistrano::Symfony::AssetMapper**

[![Gem Version](https://badge.fury.io/rb/capistrano-symfony-asset-mapper.svg)](https://badge.fury.io/rb/capistrano-symfony-asset-mapper)

**Seamless Integration for <a href="https://symfony.com/doc/current/frontend/asset_mapper.html">Symfony AssetMapper</a> in Capistrano Deployments**

This gem extends Capistrano 3.x to support Symfony's Asset Mapper and SASS build tools, automating tasks like asset installation, compilation, and SASS-to-CSS builds during deployments. It's an essential tool for modern Symfony applications that utilize the Asset Mapper.

---

## **Installation**

Before using this gem, ensure that Capistrano is properly set up in your project. Then, add the following lines to your `Gemfile`:

```ruby
gem 'capistrano', '~> 3.1.0'
gem 'capistrano-symfony'
gem 'capistrano-asset-mapper'
```

Run `bundle` to install the dependencies:

```bash
$ bundle
```

Or install the gem manually:

```bash
$ gem install capistrano-asset-mapper
```

---

## **Usage**

### **Requiring the Gem**

To use the default tasks, require the gem in your `Capfile`:

```ruby
require 'capistrano/symfony'
require 'capistrano/asset-mapper'
```

---

### **Hooks Execution**

The gem integrates with Capistrano’s deployment lifecycle. The following hooks are added automatically:

```ruby
after 'deploy:updated', 'symfony:asset_mapper:install'
after 'deploy:updated', 'symfony:asset_mapper:sass_build'
after 'deploy:updated', 'symfony:asset_mapper:compile'
```

These hooks perform the following tasks:
- **`importmap:install`**: Installs JavaScript dependencies.
- **`sass:build`**: Compiles SASS files into CSS.
- **`asset-map:compile`**: Compiles asset mappings for production.

---

### **Disabling Hooks**

If you want to skip these tasks during deployment (e.g., in non-production environments), you can disable them by setting the following variable in your `deploy.rb` or an environment-specific file (e.g., `config/deploy/production.rb`):

```ruby
set :enable_symfony_asset_mapper_hooks, false
```

Alternatively, you can disable the hooks for a single deployment by running:

```bash
cap production deploy enable_symfony_asset_mapper_hooks=false
```

---

### **Server Configuration**

Ensure that the server running the asset mapper tasks has the `web` role. For example:

```ruby
server 'node1.example.com', user: 'deploy', roles: %w{web}
server 'node2.example.com', user: 'deploy', roles: %w{web}
server 'node3.example.com', user: 'deploy', roles: %w{web}
```

This configuration ensures that tasks are executed only on servers with the `web` role.

---

### **Configurable Options**

You can customize the behavior of the gem using the following options:

```ruby
# Enable or disable Symfony Asset Mapper hooks globally
set :enable_symfony_asset_mapper_hooks, true

# Flags for the Symfony importmap:install command
set :symfony_importmap_install_flags, '--no-interaction --no-debug'

# Flags for the Symfony sass:build command
set :symfony_sass_build_flags, '--no-interaction --no-debug'

# Flags for the Symfony asset-map:compile command
set :symfony_asset_map_compile_flags, '--no-interaction --no-debug'
```

---

## **Development**

To install this gem onto your local machine, run:

```bash
$ bundle exec rake install
```

To release a new version:
1. Update the version number in `capistrano-asset-mapper.gemspec`.
2. Run:

```bash
$ bundle exec rake release
```

This command will create a git tag for the version, push commits and tags, and publish the `.gem` file to [RubyGems](https://rubygems.org).

---

## **Contributing**

We welcome contributions to improve this gem! To contribute:
1. Fork the repository.
2. Create your feature branch: `git checkout -b my-new-feature`.
3. Commit your changes: `git commit -am 'Add some feature'`.
4. Push the branch: `git push origin my-new-feature`.
5. Create a pull request.

---

## **License**

This gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

