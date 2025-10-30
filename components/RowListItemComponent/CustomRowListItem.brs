sub init()
    m.itemposter = m.top.findNode("itemPoster")
    m.itemlabel = m.top.findNode("itemLabel")

    m.itemposter.ObserveField("loadStatus", "OnLoadStatus")

end sub

sub OnLoadStatus()
    status = m.top.getChild(0).loadStatus
    if "failed" = status
        finalUrl = "https://image.roku.com/ZHZscHItMTc2/streaming-overview.jpg"
        m.top.getChild(0).uri = finalUrl
    end if
end sub

sub showcontent()
    itemcontent = m.top.itemContent
    m.itemposter.uri = itemcontent.HDPosterUrl
    m.itemlabel.text = itemcontent.title
end sub

sub showfocus()
    scale = 1 + (m.top.focusPercent * 0.08)
    m.itemposter.scale = [scale, scale]
end sub

sub showrowfocus()
    m.itemlabel.opacity = m.top.rowFocusPercent
end sub