module AppsHelper
  def titlize(type)
    if type
    else
      return DEFAULT_APP_NAME
    end
  end
end
