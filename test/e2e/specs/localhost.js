// For authoring Nightwatch tests, see
// http://nightwatchjs.org/guide#usage

module.exports = {
  'default e2e tests': function (browser) {
    const devServer = browser.globals.devServerURL

    browser
      .url(devServer)
      .waitForElementVisible('#app', 5000)
      .assert.elementPresent('#localhost')
      .assert.elementPresent('#console')
      .assert.containsText('span.hostname', 'localhost')
      .end()
  }
}
