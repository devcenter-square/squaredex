Devise.setup do |config|
  config.omniauth :slack, '8653022804.51694467346', '3f315b28d934cd1bfbe2f20141d73cba', scope: 'users:read', team: 'Devcenter-Square'
end