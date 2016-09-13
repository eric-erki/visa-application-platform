module AccessDomain
  def self.domain_ok?(domain, controller, action)
    if domain != 'admin' && DOMAIN_LIST.detect{|task| task[1] == controller && task[2] == action}
      return false
    else
      true
    end
  end

  DOMAIN_LIST = [
    ['admin', 'staffs', 'index'],
    ['admin', 'staffs', 'create'],
    ['admin', 'staffs', 'delete'],
    ['admin', 'visas', 'delete'],
  ]
end
