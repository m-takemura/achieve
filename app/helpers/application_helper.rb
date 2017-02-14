module ApplicationHelper
  def profile_img(user)
    return image_tag(user.avatar, alt: user.name) if user.avatar?

    unless user.provider.blank?
      img_url=user.image_url
    else
      img_url='no_image.png'
    end
    image_tag(img_url, alt:user.name)
  end
end

module ActionView
  module Helpers
    module FormHelper
      def error_messages!(object_name, options={})
        resource=self.instance_variable_get("@#{object_name}")
        return '' if !resource || resource.errors.empty?

        messages=resource.errors.full_messages.map{|msg| content_tag(:li,msg)}.join

        html=<<-HTML
        <div class="alert alert-danger">
         <ul>#{message}</ul>
        </div>
        HTML

        html.html_safe
      end

      def error_css(object_name, method, options={})
        resource=self.instance_variable_get("@#{object_name}")
        return '' if resource.errors.empty?

        resource.errors.include?(method)? 'has-error' : ''
      end
    end

    class FormBuilder
      def error_messages!(options={})
        @template.error_messages!(@object_name,options.merge(object: @object))
      end

      def error_css(method,options={})
        @template.errors_css(@object_name, method, options.marge(object: @object))
      end
    end
  end
end
