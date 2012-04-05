module AppsHelper
  def titlize(type)
    if type == "VoucherRedemptionApp"
      return "Voucher Redemption Application"
    elsif type == "VoucherRequestApp"
      return "Voucher Request Application"
    elsif type == "DataCollectorApp"
      return "Data Collection Application"
    elsif type == "PostToFbApp"
      return "Post to Facebook Application" 
    elsif type
      return "FILL IN IN APPS HELPER" 
    else
      return DEFAULT_APP_NAME
    end
  end
  
  def app_types
    #["Data collection", "Voucher Redemption"]
    {"Data Collection" => "DataCollectorApp", "Voucher Request" => "VoucherRequestApp", "Voucher Redemption" => "VoucherRedemptionApp" , "Post To Facebook" => "PostToFbApp"}
  end
end
