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
    // Is this await necessary?
    // await page.waitFor(250);
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