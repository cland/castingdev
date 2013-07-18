package com.cland.casting



import org.junit.*
import grails.test.mixin.*

@TestFor(CastingRoleController)
@Mock(CastingRole)
class CastingRoleControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/castingRole/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.castingRoleInstanceList.size() == 0
        assert model.castingRoleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.castingRoleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.castingRoleInstance != null
        assert view == '/castingRole/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/castingRole/show/1'
        assert controller.flash.message != null
        assert CastingRole.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/castingRole/list'

        populateValidParams(params)
        def castingRole = new CastingRole(params)

        assert castingRole.save() != null

        params.id = castingRole.id

        def model = controller.show()

        assert model.castingRoleInstance == castingRole
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/castingRole/list'

        populateValidParams(params)
        def castingRole = new CastingRole(params)

        assert castingRole.save() != null

        params.id = castingRole.id

        def model = controller.edit()

        assert model.castingRoleInstance == castingRole
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/castingRole/list'

        response.reset()

        populateValidParams(params)
        def castingRole = new CastingRole(params)

        assert castingRole.save() != null

        // test invalid parameters in update
        params.id = castingRole.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/castingRole/edit"
        assert model.castingRoleInstance != null

        castingRole.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/castingRole/show/$castingRole.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        castingRole.clearErrors()

        populateValidParams(params)
        params.id = castingRole.id
        params.version = -1
        controller.update()

        assert view == "/castingRole/edit"
        assert model.castingRoleInstance != null
        assert model.castingRoleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/castingRole/list'

        response.reset()

        populateValidParams(params)
        def castingRole = new CastingRole(params)

        assert castingRole.save() != null
        assert CastingRole.count() == 1

        params.id = castingRole.id

        controller.delete()

        assert CastingRole.count() == 0
        assert CastingRole.get(castingRole.id) == null
        assert response.redirectedUrl == '/castingRole/list'
    }
}
