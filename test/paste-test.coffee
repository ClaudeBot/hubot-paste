chai = require "chai"
sinon = require "sinon"
chai.use require "sinon-chai"

expect = chai.expect

describe "paste", ->
    beforeEach ->
        @robot =
            respond: sinon.spy()

        require("../src/paste")(@robot)

    it "registers a respond listener", ->
        expect(@robot.respond).to.have.been.calledWith(/dpaste (.+)/i)    
        if process.env.PASTEBIN_API_KEY?
            expect(@robot.respond).to.have.been.calledWith(/pastebin (.+)/i)
