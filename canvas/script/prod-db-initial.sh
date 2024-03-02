#!/bin/bash
cd /home/app/canvas
mv db/migrate/20210823222355_change_immersive_reader_allowed_on_to_on.rb .;
mv db/migrate/20210812210129_add_singleton_column.rb db/migrate/20111111214311_add_singleton_column.rb;
RAILS_ENV=production bundle exec rake db:initial_setup;

mv 20210823222355_change_immersive_reader_allowed_on_to_on.rb db/migrate/.;
RAILS_ENV=production bundle exec rake db:migrate;