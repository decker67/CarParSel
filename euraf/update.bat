d:
cd \projekte\CarParSel
del db\schema.rb
git pull
set RAILS_ENV=production
rake db:migrate
