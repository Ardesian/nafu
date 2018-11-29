module ApplicationHelper

  def slider(name, opts={})
    id = opts.delete(:id) || name
    content_tag :label, class: "switch-toggle", for: id do
      hidden = content_tag :input, "", { type: :hidden, name: name, value: false }
      input = content_tag :input, "", { type: :checkbox, id: id, name: name, value: true }.merge(opts)
      switch = content_tag :div, "", class: :switch
      "#{hidden}#{input}#{switch}".html_safe
    end
  end
end
