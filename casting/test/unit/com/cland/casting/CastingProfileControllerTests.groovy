package com.cland.casting



import org.junit.*
import grails.test.mixin.*

@TestFor(CastingProfileController)
@Mock(CastingProfile)
class CastingProfileControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/castingProfile/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.castingProfileInstanceList.size() == 0
        assert model.castingProfileInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.castingProfileInstance != null
    }

    void testSave() {
        controller.save()

        assert model.castingProfileInstance != null
        assert view == '/castingProfile/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/castingProfile/show/1'
        assert controller.flash.message != null
        assert CastingProfile.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/castingProfile/list'

        populateValidParams(params)
        def castingProfile = new CastingProfile(params)

        assert castingProfile.save() != null

        params.id = castingProfile.id

        def model = controller.show()

        assert model.castingProfileInstance == castingProfile
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/castingProfile/list'

        populateValidParams(params)
        def castingProfile = new CastingProfile(params)

        assert castingProfile.save() != null

        params.id = castingProfile.id

        def model = controller.edit()

        assert model.castingProfileInstance == castingProfile
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/castingProfile/list'

        response.reset()

        populateValidParams(params)
        def castingProfile = new CastingProfile(params)

        assert castingProfile.save() != null

        // test invalid parameters in update
        params.id = castingProfile.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/castingProfile/edit"
        assert model.castingProfileInstance != null

        castingProfile.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/castingProfile/show/$castingProfile.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        castingProfile.clearErrors()

        populateValidParams(params)
        params.id = castingProfile.id
        params.version = -1
        controller.update()

        assert view == "/castingProfile/edit"
        assert model.castingProfileInstance != null
        assert model.castingProfileInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/castingProfile/list'

        response.reset()

        populateValidParams(params)
        def castingProfile = new CastingProfile(params)

        assert castingProfile.save() != null
        assert CastingProfile.count() == 1

        params.id = castingProfile.id

        controller.delete()

        assert CastingProfile.count() == 0
        assert CastingProfile.get(castingProfile.id) == null
        assert response.redirectedUrl == '/castingProfile/list'
    }
}
