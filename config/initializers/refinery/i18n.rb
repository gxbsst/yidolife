# encoding: utf-8

Refinery::I18n.configure do |config|
  # config.enabled = true

  config.default_locale = 'zh-CN'

  config.current_locale = 'zh-CN'

  config.default_frontend_locale = 'zh-CN'

  config.frontend_locales = ['zh-CN']

  config.locales = {:'zh-CN' => '简体中文' }
end
