> Looks good, but where's the "download PDF" button?

The question seems so innocent to the client, but (until recently) generating PDFs is no easy task. For the past few years there have been two main options:

- Use PrawnPDF to manually drawn your own PDFs. This means you take all that nice HTML you've been working on, put it aside, and start over with prawn-specific syntax. This takes a lot of time and requires learning the library.
- Use wkhtmltopdf to convert your HTML to PDF. This is simpler to use than Prawn, but you'll find some fonts are missing, and some elements are not quite aligned in the right way.

This article will walk you through a third method: Using headless Chrome to generate a perfect PDF version of an HTML page.

_This article assumes you have a Rails 5 app with webpacker up and running._

1. Add Puppeteer, a Node library to control headless Chrome: `yarn add puppeteer`
2. Insert a script reference into your `package.json`:
```
"scripts": {
  "createPDF": "app/javascript/src/pdf.js"
}
```
This lets you run `"app/javascript/src/pdf.js"` by calling `yarn createPDF` from the terminal.

3. Create the script file (I put it in `app/javascript/src/pdf.js`):
```
#!/usr/bin/env node

const puppeteer = require("puppeteer");

const createPdf = async() => {
  const startTime = new Date().getTime();
  console.log("Elapsed1: " + (new Date().getTime() - startTime));
  let browser;
  try {
    browser = await puppeteer.launch({args: ['--no-sandbox', '--disable-setuid-sandbox']});
    console.log("Elapsed2: " + (new Date().getTime() - startTime));
    const page = await browser.newPage();
    console.log("Elapsed3: " + (new Date().getTime() - startTime));
    await page.goto(process.argv[2], {timeout: 30000, waitUntil: 'networkidle2'});
    console.log("Elapsed4: " + (new Date().getTime() - startTime));
    await page.pdf({
      path: process.argv[3],
      format: 'A4',
      margin: { top: 36, right: 36, bottom: 20, left: 36 },
      printBackground: true
    });
    console.log("Elapsed5: " + (new Date().getTime() - startTime));

  } catch (err) {
      console.log(err.message);
  } finally {
    if (browser) {
      browser.close();
    }
    process.exit();
  }
};
createPdf();
```
Note the logging statements aren't necessary, but it's nice to see how much time each step takes when you are first playing with this tool.

This script opens up a headless Chrome browser, navigates to a url (provided as an arg), generates the PDF, then closes the browser.

4. Test the script by running `yarn createPDF https://google.com output.pdf`. If you get an error, you may need to run `chmod +x app/javascript/src/pdf.js` to enable permissions.
5. Call this script from your controller:
```
class PagesController < ApplicationController

  def pdf
    website = params["url"] || "https://google.com"
    website = "https://#{website}" unless website[/^http/]
    tmp = Tempfile.new("tmp/pdf-chrome-puppeteer")
    system("yarn createPDF #{Shellwords.escape(website)} #{Shellwords.escape(tmp.path)}")
    pdf_filename = "output.pdf"
    send_file(tmp.path, filename: pdf_filename, type: 'application/pdf', disposition: 'attachment')
  end

end
```
And add to your routes:
```
Rails.application.routes.draw do
  ...
  get 'pdf', to: "pages#pdf"
  ...
end
```
6. Test locally by running your server, and visiting `localhost:3000/pdf?url=google.com`
7. Setup Heroku buildpacks to allow node and puppeteer to work on Heroku:
```
heroku buildpacks:add --index 1 jontewks/puppeteer
heroku buildpacks:add --index 1 heroku/nodejs
```
And deploy:
```
git add -A
git commit -m "created html->pdf feature"
git push heroku master
```
Now you can go to `yourwebsite.herokuapp.com/pdf?url=google.com` and witness the magic!

### Notes

- This isn't a fast way to generate PDFs, as you have to load a url externally before converting it. In the cases I tried, loading the url took about 4s, while converting the html to pdf only took 200ms. The next step would be figuring out how to send your own server's html straight to puppeteer, instead of giving it an external url.
- The url is loaded externally to your controller instance/Rails session, So you may need to pass a token to authenticate restricted content.
- If your site's content is location specific, note that this script will look at your server's location, not your user's location.