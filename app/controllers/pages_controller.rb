class PagesController < ApplicationController

  def pdf
    website = params["url"] || "https://google.com"
    website = "https://#{website}" unless website[/^http/]
    tmp = Tempfile.new("pdf-chrome-puppeteer")
    system("yarn createPDF #{Shellwords.escape(website)} #{Shellwords.escape(tmp.path)}")
    # pdf_data = File.read(tmp.path)
    pdf_filename = "output.pdf"
    send_file(tmp.path, filename: pdf_filename, type: 'application/pdf', disposition: 'attachment')
  end

end