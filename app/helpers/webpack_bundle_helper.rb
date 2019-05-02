module WebpackBundleHelper
  class BundleNotFound < StandardError; end

  def javascript_bundle_tag(entry, **options)
    path = asset_bundle_path("#{entry}.js")

    options = {
      src: path,
      defer: true,
    }.merge(options)

    options.delete(:defer) if options[:async]

    javascript_include_tag '', **options
  end

  def stylesheet_bundle_tag(entry, **options)
    path = asset_bundle_path("#{entry}.css")

    options = {
      href: path,
    }.merge(options)

    stylesheet_link_tag '', **options
  end

  private

  def manifest_file
    File.read('public/assets/manifest.json')
  end

  def manifest
    return @manifest ||= JSON.parse(manifest_file)
  end

  def valid_entry?(entry)
    return true if manifest.key?(entry)
    raise BundleNotFound, "Could not find bundle with name #{entry}"
  end

  def asset_bundle_path(entry, **options)
    valid_entry?(entry)

    options = {
      skip_pipeline: true
    }.merge(options)

    asset_path("assets/" + manifest.fetch(entry), **options)
  end
end