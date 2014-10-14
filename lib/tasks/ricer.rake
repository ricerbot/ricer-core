namespace :ricer do
  
  desc "Install and launch the ricer bot."
  task(:install, [:botid] => [:environment]) do |t, args|
    puts "Running migrations and seed."
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
    bot.log_info "Installing ricer bot##{bot.id}."
    bot = ricer_rake_init(args, true)
    bot.log_info "Ricer bot ##{bot.id} has been installed."
  end
  
  desc "Startup the ricer bot."
  task(:start, [:botid] => [:environment]) do |t, args|
    bot.log_info "Starting up ricer bot##{bot.id}."
    bot = ricer_rake_init(args)
    bot.load_plugins
    bot.log_info "Raisins!"
    bot.run
  end
  
  desc "Create monster langfiles for languages except en."
  task(:translate, [:botid] => :environment) do |t, args|
    bot.log_info "Loading the ricer bot."
    bot = ricer_rake_init(args, true)
    bot.log_info "Updating translation files."
    # Fire the translator
    bot.export_translations    
    bot.log_info "Done. Thx for flying ricer!"
  end
end
###
###
###
###

def ricer_rake_load_plugins(bot)
  bot.log_info "Loading plugins..."
  bot.botlog.silently {
    bot.load_plugins
  }
end

def ricer_rake_init(args={}, load_plugins=false)
  # Supported Languages
  Ricer::Application.config.rice_origin.each do |iso|
    Ricer::Locale.find_or_create_by(iso: iso)
  end
  # All Encodings
  Ricer::Encoding.create(iso: 'UTF-8') unless Ricer::Encoding.exists?('UTF-8')
  Encoding.list.each do |encoding|
    Ricer::Encoding.find_or_create_by(iso: encoding.name)
  end
  # All Timezones
  Ricer::Timezone.create(iso: 'Berlin') unless Ricer::Timezone.exists?('Berlin')
  ActiveSupport::TimeZone.all.each do |timezone|
    Ricer::Timezone.find_or_create_by(iso: timezone.name)
  end

  # Create the bot
  botid =  args[:botid] || Ricer::Application.config.rice_ean || 1
  bot = Ricer::Bot.find_or_create_by(:id => botid)
  bot.init
  ricer_rake_load_plugins(bot) if load_plugins
  bot
end
