module ApplicationHelper
  def form__field_error(field, form_obj)
    html = []
    if form_obj.errors[field].any?
      html << form_obj.errors[field].map do |msg|
        tag.div(msg, class: "text-red-400 text-xs m-0 p-0 text-right mb-2")
      end
    end
    html.join.html_safe
  end

  def prepend_flash
    turbo_stream.prepend 'flash', partial: 'shared/flash'
  end
end
