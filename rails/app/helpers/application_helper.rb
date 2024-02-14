module ApplicationHelper
  def platform_identifier
    "turbo-native" if turbo_native_app?
  end

  def page_title
    return content_for(:turbo_native_title) || content_for(:title) || "Progress Tracker" if turbo_native_app?

    content_for(:title) || "Progress Tracker"
  end
end
