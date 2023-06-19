module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-light alert-dismissible text-center text-secondary" style='position: absolute; z-index: 9999; width: 80%; border:2px solid; border-color: red; margin-top:2px; box-shadow: 0 20px 40px rgba(0, 0, 0, 0.5);'>
      <div class="row">
       <div class="col-11">
          <p class="mb-0"> #{messages}</p>
        </div>
     <div class="col-1">
      <button type="button" class="btn btn-dark diasbled text-center" data-bs-dismiss="alert" style="height:30px; display:flex; align-items: center; background-color: grey;">X</button>
        </div>
    </div>
    </div>
    HTML

    html.html_safe
  end
end
