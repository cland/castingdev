package com.cland.casting



import org.junit.*
import grails.test.mixin.*

@TestFor(CastingCategoryController)
@Mock(CastingCategory)
class CastingCategoryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/castingCategory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.castingCategoryInstanceList.size() == 0
        assert model.castingCategoryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.castingCategoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.castingCategoryInstance != null
        assert view == '/castingCategory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/castingCategory/show/1'
        assert controller.flash.message != null
        assert CastingCategory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/castingCategory/list'

        populateValidParams(params)
        def castingCategory = new CastingCategory(params)

        assert castingCategory.save() != null

        params.id = castingCategory.id

        def model = controller.show()

        assert model.castingCategoryInstance == castingCategory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/castingCategory/list'

        populateValidParams(params)
        def castingCategory = new CastingCategory(params)

        assert castingCategory.save() != null

        params.id = castingCategory.id

        def model = controller.edit()

        assert model.castingCategoryInstance == castingCategory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/castingCategory/list'

        response.reset()

        populateValidParams(params)
        def castingCategory = new CastingCategory(params)

        assert castingCategory.save() != null

        // test invalid parameters in update
        params.id = castingCategory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/castingCategory/edit"
        assert model.castingCategoryInstance != null

        castingCategory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/castingCategory/show/$castingCategory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        castingCategory.clearErrors()

        populateValidParams(params)
        params.id = castingCategory.id
        params.version = -1
        controller.update()

        assert view == "/castingCategory/edit"
        assert model.castingCategoryInstance != null
        assert model.castingCategoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/castingCategory/list'

        response.reset()

        populateValidParams(params)
        def castingCategory = new CastingCategory(params)

        assert castingCategory.save() != null
        assert CastingCategory.count() == 1

        params.id = castingCategory.id

        controller.delete()

        assert CastingCategory.count() == 0
        assert CastingCategory.get(castingCategory.id) == null
        assert response.redirectedUrl == '/castingCategory/list'
    }
}
