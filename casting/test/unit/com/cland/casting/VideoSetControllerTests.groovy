package com.cland.casting



import org.junit.*
import grails.test.mixin.*

@TestFor(VideoSetController)
@Mock(VideoSet)
class VideoSetControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/videoSet/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.videoSetInstanceList.size() == 0
        assert model.videoSetInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.videoSetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.videoSetInstance != null
        assert view == '/videoSet/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/videoSet/show/1'
        assert controller.flash.message != null
        assert VideoSet.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/videoSet/list'

        populateValidParams(params)
        def videoSet = new VideoSet(params)

        assert videoSet.save() != null

        params.id = videoSet.id

        def model = controller.show()

        assert model.videoSetInstance == videoSet
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/videoSet/list'

        populateValidParams(params)
        def videoSet = new VideoSet(params)

        assert videoSet.save() != null

        params.id = videoSet.id

        def model = controller.edit()

        assert model.videoSetInstance == videoSet
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/videoSet/list'

        response.reset()

        populateValidParams(params)
        def videoSet = new VideoSet(params)

        assert videoSet.save() != null

        // test invalid parameters in update
        params.id = videoSet.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/videoSet/edit"
        assert model.videoSetInstance != null

        videoSet.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/videoSet/show/$videoSet.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        videoSet.clearErrors()

        populateValidParams(params)
        params.id = videoSet.id
        params.version = -1
        controller.update()

        assert view == "/videoSet/edit"
        assert model.videoSetInstance != null
        assert model.videoSetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/videoSet/list'

        response.reset()

        populateValidParams(params)
        def videoSet = new VideoSet(params)

        assert videoSet.save() != null
        assert VideoSet.count() == 1

        params.id = videoSet.id

        controller.delete()

        assert VideoSet.count() == 0
        assert VideoSet.get(videoSet.id) == null
        assert response.redirectedUrl == '/videoSet/list'
    }
}
