namespace :db do
  desc "Populates"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    App.create!(:app_code => DEFAULT_APP_CODE, :name => DEFAULT_APP_NAME, :description => DEFAULT_APP_DESCRIPTION)
    VoucherRedemptionApp.create!(:app_code => "111", :name => "Pilot PSI redemption voucher", :description => "Demoing voucher redemption")
    VoucherRedemptionApp.create!(:app_code => "333", :name => "Pilot random redemption voucher", :description => "Demoing voucher redemption")
    VoucherRequestApp.create!(:app_code => "222", :name => "Pilot PSI request", :description => "Demoing voucher request")
    VoucherRequestApp.create!(:app_code => "444", :name => "Pilot random request", :description => "Demoing voucher request")
  end
end
