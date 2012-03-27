namespace :db do
  desc "Populates"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    App.create!(:app_code => DEFAULT_APP_CODE, :name => DEFAULT_APP_NAME, :description => DEFAULT_APP_DESCRIPTION)
    VoucherRedemptionApp.create!(:app_code => "888", :name => "PSI direct", :description => "PSI rep gives actual voucher")
    VoucherRedemptionApp.create!(:app_code => "999", :name => "Random direct", :description => "Random person gives actual voucher")
    VoucherRedemptionApp.create!(:app_code => "111", :name => "PSI indirect", :description => "PSI gives card to claim voucher")
    VoucherRedemptionApp.create!(:app_code => "333", :name => "Random indirect ", :description => "Random gives card to claim voucher")
    VoucherRequestApp.create!(:app_code => "222", :name => "Pilot PSI request", :description => "Demoing voucher request")
    VoucherRequestApp.create!(:app_code => "444", :name => "Pilot random request", :description => "Demoing voucher request")
    
    sales = DataCollectorApp.create!(:app_code => "123", :name => "Pilot data collection", :description => "Test of SMS automated data entry")
    
    sales.app_vars.create!(:name => "product", :str_val => "c")
    sales.app_vars.create!(:name => "product", :str_val => "x")
    sales.app_vars.create!(:name => "product", :str_val => "s")
    sales.app_vars.create!(:name => "product", :str_val => "a")
    sales.app_vars.create!(:name => "product", :str_val => "y")
    sales.app_vars.create!(:name => "product", :str_val => "f")
    sales.app_vars.create!(:name => "product", :str_val => "g")
    
    sales.app_vars.create!(:name => "promotion", :str_val => "p")
    sales.app_vars.create!(:name => "promotion", :str_val => "v")
    
  end
end
