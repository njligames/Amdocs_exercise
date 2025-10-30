function NJLICSDKWait(timeout as integer) as dynamic
    return njlicSDK()._wait(timeout)
end function

function njlicSDK() as object

    globalAA = getGLobalAA()
    if globalAA.NJLICSDKInstance <> invalid then return globalAA.NJLICSDKInstance

    NJLICSDKInstance = {
        port: invalid
        messageObservable: NJLICSDK_Utils_Observable()
        initialisePromise: invalid
        logger: invalid

        '|----------------------------------------------|
        '|              Public Methods                  |
        '|----------------------------------------------|

        getPlayerController: function() as object
            return NJLICSDK_Player_PlayerController()
        end function

        onMessage: function(callBack as string, callbackOwner as object) as void
            m.messageObservable.registerObserver(callBack, callbackOwner)
        end function

        removeEventListeners: function(callBackOwner as object) as void
            m.messageObservable.unRegisterObservers(callBackOwner)
        end function

        setMessagePort: function(port as object) as void
            m.port = port
        end function

        initLogger: function(params = {} as object) as void
            m.logger = newLogger(params)
        end function

        '|----------------------------------------------|
        '|       Private Methods                        |
        '|----------------------------------------------|

        _processMessage: function(msg as dynamic) as void
            if msg = invalid
                m.logger.error(NJLICSDK_UtilsStringUtils().substitute("{0} message = {1}", "njlicSDK._processMessage", NJLICSDK_UtilsStringUtils().toString(msg)))
                return
            end if
            _event = { field: msg.getField(), data: msg.getData() }
            m.messageObservable.notifyObservers(_event)
        end function

        _wait: function(timeout as integer) as object
            if timeout < 0 then timeout = 0
            while true
                waitMessage = wait(timeout, m.port)
                m._processMessage(waitMessage)
                return waitMessage
            end while
            return invalid
        end function
    }

    globalAA.NJLICSDKInstance = NJLICSDKInstance
    return NJLICSDKInstance
end function
