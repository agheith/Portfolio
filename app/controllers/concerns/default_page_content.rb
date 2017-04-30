module DefaultPageContent
    extend ActiveSupport::Concern

    included do
        before_filter :set_page_defaults
    end

    def set_page_defaults
        @page_title = "Portfolio | Amer Ghetih"
        @seo_keywords = "Amer Gheith Portfolio"
    end

end
