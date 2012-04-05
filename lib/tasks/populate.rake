namespace :db do
  desc "Populates"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    App.create!(:app_code => DEFAULT_APP_CODE, :name => DEFAULT_APP_NAME, :description => DEFAULT_APP_DESCRIPTION)
    #VoucherRedemptionApp.create!(:app_code => "888", :name => "PSI direct", :description => "PSI rep gives actual voucher")
    #VoucherRedemptionApp.create!(:app_code => "999", :name => "Random direct", :description => "Random person gives actual voucher")
    VoucherRedemptionApp.create!(:app_code => "111", :name => "Indirect redemption Certeza", :description => "Pilot")
    VoucherRedemptionApp.create!(:app_code => "333", :name => "Indirect redemption Jeitosa ", :description => "Pilot")
    VoucherRequestApp.create!(:app_code => "222", :name => "Request Certeza", :description => "Pilot")
    VoucherRequestApp.create!(:app_code => "444", :name => "Request Jeito", :description => "Pilot")
    
    sales = DataCollectorApp.create!(:app_code => "232", :name => "Pilot data collection", :description => "Test of SMS automated data entry")
    
    sales.app_vars.create!(:name => "product", :str_val => "c")
    sales.app_vars.create!(:name => "product", :str_val => "x")
    sales.app_vars.create!(:name => "product", :str_val => "s")
    sales.app_vars.create!(:name => "product", :str_val => "a")
    sales.app_vars.create!(:name => "product", :str_val => "y")
    sales.app_vars.create!(:name => "product", :str_val => "f")
    sales.app_vars.create!(:name => "product", :str_val => "g")
    
    sales.app_vars.create!(:name => "promotion", :str_val => "p")
    sales.app_vars.create!(:name => "promotion", :str_val => "v")
    
    PostToFbApp.create!(:app_code => "7MM", :name => "Jeitosa in Verdade April test", :description => "Piloting having people text into the platform and post to FB")
    
  end
end
