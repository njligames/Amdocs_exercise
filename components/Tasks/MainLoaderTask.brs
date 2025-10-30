sub Init()
    m.top.functionName = "GetContent"
end sub

sub GetContent()
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetURL("https://cd-static.bamgrid.com/dp-117731241344/home.json")
    rsp = xfer.GetToString()
    rootChildren = []

    json = ParseJson(rsp)
    if invalid <> json
        containers = json?.data?.StandardCollection?.containers
        if invalid <> containers
            for each container in containers
                set = container?.set
                if invalid <> set and invalid <> set.type
                    if "SetRef" = set.type
                        refId = set?.refId
                        title = "Empty"
                        _title = set?.text?.title?.full?.set?.default?.content
                        if invalid <> _title then title = _title

                        if invalid <> refId
                            ' xfer.SetURL("https://cd-static.bamgrid.com/dp-117731241344/sets/" + refId + ".json")
                            url = NJLICSDK_UtilsStringUtils().substitute("https://cd-static.bamgrid.com/dp-117731241344/sets/{0}.json", refId)
                            xfer.SetURL(url)
                            rsp = xfer.GetToString()

                            refid_json = ParseJson(rsp)
                            if invalid <> refid_json
                                items = refid_json?.data?.CuratedSet?.items
                                if invalid <> items
                                    row = {}
                                    row.title = title
                                    row.children = []
                                    for each item in items
                                        itemData = _getItemData(item)
                                        row.children.Push(itemData)
                                    end for
                                    rootChildren.Push(row)
                                end if
                            end if
                        end if
                    else if "CuratedSet" = set.type
                        ' I added this so that there will be more rows; and basically because I can....
                        items = set?.items
                        title = "Empty"
                        _title = set?.text?.title?.full?.set?.default?.content
                        if invalid <> _title then title = _title
                        if invalid <> items
                            row = {}
                            row.title = title
                            row.children = []
                            for each item in items
                                itemData = _getItemData(item)
                                row.children.Push(itemData)
                            end for
                            rootChildren.Push(row)
                        end if
                    end if
                end if
            next
        end if
        contentNode = CreateObject("roSGNode", "ContentNode")
        contentNode.Update({
            children: rootChildren
        }, true)
        m.top.content = contentNode
    end if
end sub

function _parseImageUrl(image as object) as string
    finalUrl = "https://image.roku.com/ZHZscHItMTc2/streaming-overview.jpg"
    if invalid <> image
        url = image?.series?.default?.url
        if invalid = url then url = image?.program?.default?.url
        if invalid = url then url = image?.default?.default?.url
        if invalid <> url then finalUrl = url
    end if
    return finalUrl
end function

function _getItemData(video as object) as object

    finalTileUrl = _parseImageUrl(video?.image?.tile?["1.78"])
    finalBackgroundUrl = _parseImageUrl(video?.image?.hero_tile?["1.78"])
    finalBackgroundDetails = _parseImageUrl(video?.image?.background_details?["1.78"])

    title = "Empty"
    content = video?.text?.title?.full?.series?.default?.content
    if invalid = content then content = video?.text?.title?.full?.program?.default?.content
    if invalid = content then content = video?.text?.title?.full?.collection?.default?.content
    if invalid <> content then title = content

    category = "Empty"
    content = video?.tags?[0]?.type
    ' if invalid = content then content = video?.text?.title?.full?.program?.default?.content
    ' if invalid = content then content = video?.text?.title?.full?.collection?.default?.content
    if invalid <> content then category = content

    itemContent = createObject("RoSGNode", "ContentNode")
    itemContent.HDPosterUrl = finalTileUrl
    itemContent.title = title
    itemContent.category = category
    itemContent.FHDPosterUrl = finalBackgroundUrl
    itemContent.SDPosterUrl = finalBackgroundDetails



    ' m.selectedLabel.text = "selectedName"
    ' m.selectedText.text = "selectedText"
    ' m.selectedLabelCategory.text = "m.categories[row]"
    return itemContent
end function
