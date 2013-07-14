package com.cland.casting



import org.junit.*
import grails.test.mixin.*

@TestFor(ProductionController)
@Mock(Production)
class ProductionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/production/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.productionInstanceList.size() == 0
        assert model.productionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.productionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.productionInstance != null
        assert view == '/production/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/production/show/1'
        assert controller.flash.message != null
        assert Production.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/production/list'

        populateValidParams(params)
        def production = new Production(params)

        assert production.save() != null

        params.id = production.id

        def model = controller.show()

        assert model.productionInstance == production
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/production/list'

        populateValidParams(params)
        def production = new Production(params)

        assert production.save() != null

        params.id = production.id

        def model = controller.edit()

        assert model.productionInstance == production
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/production/list'

        response.reset()

        populateValidParams(params)
        def production = new Production(params)

        assert production.save() != null

        // test invalid parameters in update
        params.id = production.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/production/edit"
        assert model.productionInstance != null

        production.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/production/show/$production.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        production.clearErrors()

        populateValidParams(params)
        params.id = production.id
        params.version = -1
        controller.update()

        assert view == "/production/edit"
        assert model.productionInstance != null
        assert model.productionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/production/list'

        response.reset()

        populateValidParams(params)
        def production = new Production(params)

        assert production.save() != null
        assert Production.count() == 1

        params.id = production.id

        controller.delete()

        assert Production.count() == 0
        assert Production.get(production.id) == null
        assert response.redirectedUrl == '/production/list'
    }
}
