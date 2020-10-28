module BreadcrumbHelper
  class BreadcrumbBuilder
    include ActionView::Helpers::UrlHelper

    attr_accessor :breadcrumbs

    def initialize
      @breadcrumbs = ""
    end

    def self.build
      builder = new
      yield(builder)

      %Q(
        <nav aria-label="breadcrumbs" class="mb-4">
          <ol class="breadcrumb">
            #{builder.breadcrumbs}
          </ol>
        </nav>
      ).html_safe
    end

    def item(text, path=nil)
      if path
        @breadcrumbs += %Q(
          <li class="breadcrumb-item">
            <a href="#{url_for(path)}">#{text}</a>
          </li>
        )
      else
        @breadcrumbs += %Q(<li class="breadcrumb-item active">#{text}</li>)
      end
    end
  end

  def breadcrumbs(&block)
    BreadcrumbBuilder.build(&block)
  end
end

=begin
= breadcrummbs |b| do
  = b "" link
=end
