namespace :symfony do
  namespace :asset_mapper do
    desc "Install JavaScript dependencies using ImportMap"
    task :install do
      on roles(:web) do
        symfony_console "importmap:install", fetch(:symfony_importmap_install_flags)
      end
    end

    desc "Compile SASS files into CSS"
    task :sass_build do
      on roles(:web) do
        symfony_console "sass:build", fetch(:symfony_sass_build_flags)
      end
    end

    desc "Compile asset mappings for production"
    task :compile do
      on roles(:web) do
        symfony_console "asset-map:compile", fetch(:symfony_asset_map_compile_flags)
      end
    end
  end
end

namespace :load do
  desc "Set default flags for Symfony asset tasks"
  task :defaults do
    set :enable_symfony_asset_mapper_hooks, true
    set :symfony_importmap_install_flags, '--no-interaction --no-debug'
    set :symfony_sass_build_flags, '--no-interaction --no-debug'
    set :symfony_asset_map_compile_flags, '--no-interaction --no-debug'
  end
end

# Hooks pour exécuter automatiquement les tâches
after 'deploy:updated', 'symfony:asset_mapper:install' if fetch(:enable_symfony_asset_mapper_hooks)
after 'deploy:updated', 'symfony:asset_mapper:sass_build' if fetch(:enable_symfony_asset_mapper_hooks)
after 'deploy:updated', 'symfony:asset_mapper:compile' if fetch(:enable_symfony_asset_mapper_hooks)
