package com.cland.casting

import org.springframework.dao.DataIntegrityViolationException

class CastingRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [castingRoleInstanceList: CastingRole.list(params), castingRoleInstanceTotal: CastingRole.count()]
    }

    def create() {
        [castingRoleInstance: new CastingRole(params)]
    }

    def save() {
        def castingRoleInstance = new CastingRole(params)
        if (!castingRoleInstance.save(flush: true)) {
            render(view: "create", model: [castingRoleInstance: castingRoleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), castingRoleInstance.id])
        redirect(action: "show", id: castingRoleInstance.id)
    }

    def show(Long id) {
        def castingRoleInstance = CastingRole.get(id)
        if (!castingRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), id])
            redirect(action: "list")
            return
        }

        [castingRoleInstance: castingRoleInstance]
    }

    def edit(Long id) {
        def castingRoleInstance = CastingRole.get(id)
        if (!castingRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), id])
            redirect(action: "list")
            return
        }

        [castingRoleInstance: castingRoleInstance]
    }

    def update(Long id, Long version) {
        def castingRoleInstance = CastingRole.get(id)
        if (!castingRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (castingRoleInstance.version > version) {
                castingRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'castingRole.label', default: 'CastingRole')] as Object[],
                          "Another user has updated this CastingRole while you were editing")
                render(view: "edit", model: [castingRoleInstance: castingRoleInstance])
                return
            }
        }

        castingRoleInstance.properties = params

        if (!castingRoleInstance.save(flush: true)) {
            render(view: "edit", model: [castingRoleInstance: castingRoleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), castingRoleInstance.id])
        redirect(action: "show", id: castingRoleInstance.id)
    }

    def delete(Long id) {
        def castingRoleInstance = CastingRole.get(id)
        if (!castingRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), id])
            redirect(action: "list")
            return
        }

        try {
            castingRoleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), id])
            redirect(action: "show", id: id)
        }
    }
}
