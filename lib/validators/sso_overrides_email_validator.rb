# frozen_string_literal: true

class SsoOverridesEmailValidator
  def initialize(opts = {})
    @opts = opts
  end

  def valid_value?(val)
    return true if val == 'f'
    return false if SiteSetting.email_editable?
    true
  end

  def error_message
    if SiteSetting.email_editable?
      I18n.t('site_settings.errors.email_editable_enabled')
    end
  end
end
