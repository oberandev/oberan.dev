defmodule OberanWeb.SitemapHTML do
  use OberanWeb, :html

  embed_templates "sitemap_html/*"

  def today, do: Date.utc_today()

  def pages do
    [
      ~p"/",
      ~p"/contact",
      ~p"/privacy"
    ]
  end

  # https://developers.google.com/search/docs/crawling-indexing/sitemaps/build-sitemap
  def show_pages do
    for path <- pages() do
      route = OberanWeb.Endpoint.url() <> path

      """
      <url>
        <loc>#{route}</loc>
        <lastmod>#{today()}</lastmod>
      </url>
      """
    end
  end
end
