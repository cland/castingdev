package com.cland.casting



import org.junit.*
import grails.test.mixin.*

@TestFor(PictureSetController)
@Mock(PictureSet)
class PictureSetControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pictureSet/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pictureSetInstanceList.size() == 0
        assert model.pictureSetInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pictureSetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pictureSetInstance != null
        assert view == '/pictureSet/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pictureSet/show/1'
        assert controller.flash.message != null
        assert PictureSet.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pictureSet/list'

        populateValidParams(params)
        def pictureSet = new PictureSet(params)

        assert pictureSet.save() != null

        params.id = pictureSet.id

        def model = controller.show()

        assert model.pictureSetInstance == pictureSet
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pictureSet/list'

        populateValidParams(params)
        def pictureSet = new PictureSet(params)

        assert pictureSet.save() != null

        params.id = pictureSet.id

        def model = controller.edit()

        assert model.pictureSetInstance == pictureSet
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pictureSet/list'

        response.reset()

        populateValidParams(params)
        def pictureSet = new PictureSet(params)

        assert pictureSet.save() != null

        // test invalid parameters in update
        params.id = pictureSet.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pictureSet/edit"
        assert model.pictureSetInstance != null

        pictureSet.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pictureSet/show/$pictureSet.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pictureSet.clearErrors()

        populateValidParams(params)
        params.id = pictureSet.id
        params.version = -1
        controller.update()

        assert view == "/pictureSet/edit"
        assert model.pictureSetInstance != null
        assert model.pictureSetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pictureSet/list'

        response.reset()

        populateValidParams(params)
        def pictureSet = new PictureSet(params)

        assert pictureSet.save() != null
        assert PictureSet.count() == 1

        params.id = pictureSet.id

        controller.delete()

        assert PictureSet.count() == 0
        assert PictureSet.get(pictureSet.id) == null
        assert response.redirectedUrl == '/pictureSet/list'
    }
}
