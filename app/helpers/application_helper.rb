module ApplicationHelper

  def all_table(model, *attributes)
    render partial: 'partials/table', locals: {model: model, attrs: attributes}
  end

end
