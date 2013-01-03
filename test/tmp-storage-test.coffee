
should = chai.should()
mocha.setup 'bdd'

after = (time,callback)-> setTimeout callback,time

describe 'TmpStorage', ->

	storage = new TmpStorage 'test'

	describe 'get', ->
		it 'should serilize/unserilize object', ->
			storage.setItem 'array',[1..9]
			storage.getItem('array').should.deep.equal [1..9]

	describe 'expires', ->
		storage.setItem 'vanish later', true, '2sec'
		it 'should be available before expiration', (done)->
			after 500, ->
				storage.getItem('vanish later').should.equal true
				done()

	describe 'expires', ->
		storage.setItem 'expires', true, '1sec'
		it 'should vanish after expiration', (done)->
			after 1000, ->
				should.not.exist storage.getItem 'expires'
				done()

