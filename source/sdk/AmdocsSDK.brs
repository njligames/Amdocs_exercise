function AmdocsSDKWait(timeout as integer) as dynamic
    return amdocsSDK()._wait(timeout)
end function

function amdocsSDK() as object

    globalAA = getGLobalAA()
    if globalAA.AmdocsSDKInstance <> invalid then return globalAA.AmdocsSDKInstance

    AmdocsSDKInstance = {
        port: invalid
        messageObservable: AmdocsSDK_Utils_Observable()
        initialisePromise: invalid
        logger: invalid

        '|----------------------------------------------|
        '|              Public Methods                  |
        '|----------------------------------------------|

        getPlayerController: function() as object
            return AmdocsSDK_Player_PlayerController()
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
                m.logger.error(AmdocsSDK_UtilsStringUtils().substitute("{0} message = {1}", "AmdocsSDK._processMessage", AmdocsSDK_UtilsStringUtils().toString(msg)))
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

    globalAA.AmdocsSDKInstance = AmdocsSDKInstance
    return AmdocsSDKInstance
end function
