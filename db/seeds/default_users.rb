module Seeds
  class DefaultUsers
    def self.run
      User.create(account: 'admin', password: 'admin', role: Role.find_by(name: 'admin'))
      User.create(account: 'test1', password: 'test1', role: Role.find_by(name: 'user'))
    end
  end
end
