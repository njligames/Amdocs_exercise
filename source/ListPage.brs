function ListPage() as object
    this = {
        view: invalid
        type: "ListPage"

        '|----------------------------------------------|
        '|              Public Methods                  |
        '|----------------------------------------------|

        init: function() as void
            m.view = CreateObject("roSGNode", "ListPageView")
            m.contentTask = CreateObject("roSGNode", "MainLoaderTask")
            njlicSDK().onMessage("processMessage", m)

            m.view.observeField("selectedAsset", getGlobalAA().port)
            m.contentTask.ObserveFieldScoped("content", njlicSDK().port)
        end function

        load: function(data = invalid as object) as void
            m.contentTask.control = "run"
        end function

        destroy: function() as void
            m.view.unObserveField("selectedAsset")
        end function

        processMessage: function(_event)
            if invalid = _event
                m.logger.error(NJLICSDK_UtilsStringUtils().substitute("{0} message = {1}", "PlayerPage.processMessage", NJLICSDK_UtilsStringUtils().toString(_event)))
            else
                if _event.field = "content"
                    m.view.content = _event.data
                end if
            end if
        end function

    }
    this.init()
    return this
end function
