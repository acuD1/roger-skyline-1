'use strict'

var control = require('unified-message-control')
var marker = require('mdast-comment-marker')
var xtend = require('xtend')

module.exports = messageControl

function messageControl(options) {
  return control(xtend({marker: marker, test: 'html'}, options))
}
