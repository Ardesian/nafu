module ApplicationHelper
  def is_controller?(controller, action=nil)
    return false unless params[:controller] == controller.to_s
    return true if action.blank?
    params[:action] == action.to_s
  end

  def slider(name, opts={})
    id = opts.delete(:id) || name
    content_tag :label, class: "switch-toggle", for: id do
      hidden = content_tag :input, "", { type: :hidden, name: name, value: false }
      input = content_tag :input, "", { type: :checkbox, id: id, name: name, value: true }.merge(opts)
      switch = content_tag :div, "", class: :switch
      "#{hidden}#{input}#{switch}".html_safe
    end
  end

  def parsley(*parsley_values, **parsley_settings)
    parsley_settings[:error_message] ||= parsley_settings.delete(:message) if parsley_settings[:message].present?
    parsley_values << :errors_messages_disabled if parsley_values.delete(:no_message)

    parsley_hash = {}
    parsley_values.each do |present_key|
      parsley_hash["parsley_#{present_key}"] = true
    end
    parsley_settings.each do |option_key, option_val|
      parsley_hash["parsley_#{option_key}"] = option_val
    end
    parsley_hash
  end
end
