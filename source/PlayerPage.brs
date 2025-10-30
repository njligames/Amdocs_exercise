function PlayerPage() as object
    this = {
        view: invalid
        session: invalid
        playerController: invalid
        type: "PlayerPage"
        logger: njlicSDK().logger

        '|----------------------------------------------|
        '|              Public Methods                  |
        '|----------------------------------------------|

        init: function() as void
            m.view = CreateObject("roSGNode", "PlayerPageView")
            m.view.observeField("backPressed", getGlobalAA().port)
        end function

        load: function(data = invalid as object) as void
            m._registerPlayerPageObservers()

            m.loggingView = m.view.findNode("loggingView")
            if invalid <> m.logger and (m.logger.options.disableLoggingToScreen or m.logger.options.disableLogging)
                m.loggingView.visible = false
            end if

            commonPlayer = m.view.findNode("commonPlayer")
            controls = m.view.findNode("buttonsBar")
            njlicSDK().onMessage("processMessage", m)
            controls.ObserveFieldScoped("control", njlicSDK().port)
            controls.ObserveFieldScoped("seek", njlicSDK().port)
            controls.ObserveFieldScoped("toggleSessionConfig", njlicSDK().port)
            controls.ObserveFieldScoped("toggleSessionInfo", njlicSDK().port)

            m.playerController = m._getPlayerController()
            m.playerController.onSessionCreated("_handleSessionCreated", m)
            m.playerController.createSession(data, commonPlayer)
        end function

        destroy: function() as void
            m.view.unObserveField("backPressed")
            m.playerController.destroy()
            m.playerController = invalid
            m.view = invalid
        end function

        _registerSessionObservables: function()
            m.session.onStateChanged("_handleStateChanged", m)
            m.session.onSeekChanged("_handleSeekChanged", m)
            m.session.onPositionChanged("_handlePositionChanged", m)
        end function

        _registerPlayerPageObservers: function()
            m.view.ObserveField("setControl", njlicSDK().port)
        end function

        _unregisterPlayerPageObservers: function()
            m.view.unObserveField("setControl")
        end function

        processMessage: function(_event)
            if invalid = _event
                m.logger.error(NJLICSDK_UtilsStringUtils().substitute("{0} message = {1}", "PlayerPage.processMessage", NJLICSDK_UtilsStringUtils().toString(_event)))
            else
                if _event.field = "control"
                    if Commands().pause = _event.data
                        m.session.pause()
                    end if
                    if Commands().resume = _event.data
                        m.session.resume()
                    end if
                    if Commands().fastforward = _event.data
                    end if
                    if Commands().rewind = _event.data
                    end if
                end if
                if _event.field = "seek"
                    m.session.seek(_event.data)
                end if
                if _event.field = "toggleSessionConfig"
                    m.loggingView.visible = _event.data
                end if
                if _event.field = "toggleSessionInfo"
                    lines = [
                        "",
                        "*****************************************************************************************************************************************",
                        "* Instructions:                                                                                                                          ",
                        "* Toggle the pause/play button to pause and play the video.                                                                              ",
                        "* Press the fast forward button to fast forward the playback. The video will pause while this happens. Press again to continue playing.  ",
                        "* Press the rewind button to rewind the playback. The video will pause while this happens. Press again to continue playing.              "
                        "*****************************************************************************************************************************************",
                    ]
                    m.logger.fatal(NJLICSDK_UtilsStringUtils().join(lines, Chr(10)))
                end if
            end if
        end function

        _getPlayerController: function() as object
            return njlicSDK().getPlayerController()
        end function

        '|----------------------------------------------|
        '|                 Callbacks                    |
        '|----------------------------------------------|

        _handleSessionCreated: function(session as object) as void
            m.session = session
            m._registerSessionObservables()
        end function

        _handleStateChanged: function(state) as void
            msg = {
                data: state
                field: "state"
            }
            m.view.callFunc("processMessage", { payload: msg })
        end function

        _handleSeekChanged: function(seconds) as void
            msg = {
                data: seconds
                field: "seek"
            }
            m.view.callFunc("processMessage", { payload: msg })
        end function

        _handlePositionChanged: function(seconds) as void
            msg = {
                data: seconds
                field: "position"
            }
            m.view.callFunc("processMessage", { payload: msg })
        end function

    }
    this.init()
    return this
end function
