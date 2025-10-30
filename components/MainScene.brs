function Init()
end function

function onKeyEvent(key as string, press as boolean) as boolean
    if press then return true
    if key = "back"
        m.top.backPressed = true
    end if
    return true
end function
