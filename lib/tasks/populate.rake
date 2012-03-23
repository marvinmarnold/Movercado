namespace :db do
  desc "Populates"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    App.create!(:app_code => DEFAULT_APP_CODE, :name => DEFAULT_APP_NAME, :description => DEFAULT_APP_DESCRIPTION)
    VoucherRedemptionApp.create!(:app_code => "111", :name => "Demo for shops pilot", :description => "Demoing voucher redemption")
    VoucherRequestApp.create!(:app_code => "222", :name => "Demo for shops pilot", :description => "Demoing voucher request")
  end
end
