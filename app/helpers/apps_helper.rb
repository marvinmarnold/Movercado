module AppsHelper
  def titlize(type)
    if type
    else
      return DEFAULT_APP_NAME
    end
  end
  
  def app_types
    ["Data collection", "Voucher Redemption"]
  end
end
