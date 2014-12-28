assert = require 'power-assert'
sinon = require 'sinon'

describe 'parseConfig', ->
  beforeEach ->
    @sinon = sinon.sandbox.create()
    @env = process.env

  afterEach ->
    process.env = @env
    @sinon.restore()

  describe 'with ("xxx", { yyy: null })', ->
    beforeEach ->
      @scriptName = 'xxx'
      @configurations = { yyy: null }

    context 'when process.env.HUBOT_XXX_YYY is not defined', ->
      beforeEach ->
        process.env = {}
        @subject = require('../src/')(@scriptName, @configurations)

      it 'config.yyy is null', ->
        assert.deepEqual @subject, { yyy: null }

    context 'when process.env.HUBOT_XXX_YYY is 123', ->
      beforeEach ->
        @HUBOT_XXX_YYY = 123
        process.env = { @HUBOT_XXX_YYY }
        @subject = require('../src/')(@scriptName, @configurations)

      it 'config.yyy is 123', ->
        assert.deepEqual @subject, { yyy: 123 }

  describe 'with ("aaa-bbb", { cccDdd: "foo" })', ->
    beforeEach ->
      @scriptName = 'aaa-bbb'
      @configurations = { cccDdd: 'foo' }

    context 'when process.env.HUBOT_AAA_BBB_CCC_DDD is not defined', ->
      beforeEach ->
        process.env = {}
        @subject = require('../src/')(@scriptName, @configurations)

      it 'config.cccDdd is null', ->
        assert.deepEqual @subject, { cccDdd: 'foo' }

    context 'when process.env.HUBOT_AAA_BBB_CCC_DDD is "bar"', ->
      beforeEach ->
        @HUBOT_AAA_BBB_CCC_DDD = 'bar'
        process.env = { @HUBOT_AAA_BBB_CCC_DDD }
        @subject = require('../src/')(@scriptName, @configurations)

      it 'config.cccDdd is "bar"', ->
        assert.deepEqual @subject, { cccDdd: 'bar' }
