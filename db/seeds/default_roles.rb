module Seeds
  class DefaultRoles
    def self.run
      Role.create(name: 'user')
      Role.create(name: 'admin')
    end
  end
end
