function Init() as void
    m.selectedLabel = m.top.findNode("selectedLabel")
    m.selectedLabelCategory = m.top.findNode("selectedLabelCategory")
    m.selectedText = m.top.findNode("selectedText")
    m.assetImage = m.top.findNode("assetImage")
    m.rowList = m.top.findNode("rowList")
    m.rowList.SetFocus(true)
    m.rowList.ObserveField("rowItemFocused", "OnItemFocused")
    m.rowList.observeField("itemSelected", "handleButtonClick")
    m.top.observeField("focusedChild", "onCurrentFocusedChildChanged")
    m.top.observeField("items", "onItemsChanged")
    m.focused = false

    m.categories = []
    m.itemList = {}
end function

sub OnItemFocused()
    focusedIndex = m.rowList.rowItemFocused
    row = m.rowList.content.GetChild(focusedIndex[0])
    item = row.GetChild(focusedIndex[1])

    m.selectedLabel.text = item.title
    m.selectedText.text = item.title
    m.selectedLabelCategory.text = item.category
    m.assetImage.uri = item.FHDPosterUrl
end sub

function onItemsChanged() as void
    _buildItemList()
    m.rowList.content = _getRowListContent()
end function

function _buildItemList() as void
    for i = 0 to m.top.items.Count() - 1
        item = m.top.items[i]
        for j = 0 to item.metadata.categories.Count() - 1
            cat = item.metadata.categories[j]
            if m.itemList[cat] = invalid
                m.itemList[cat] = []
                m.categories.Push(cat)
            end if
            m.itemList[cat].Push(item)
        end for
    end for
end function

function _getRowListContent() as object
    data = CreateObject("roSGNode", "ContentNode")
    for i = 0 to m.categories.Count() - 1
        _createRowAssets(data, m.categories[i])
    end for
    return data
end function

function _createRowAssets(data, category) as void
    row = data.CreateChild("ContentNode")
    row.title = category
    for each _ in m.itemList[category]
        row.CreateChild("RowListItemData")
    end for
end function

function handleButtonClick(_) as void
    row = m.rowList.rowItemSelected[0]
    col = m.rowList.rowItemSelected[1]

    item = Assets()[0]
    m.top.selectedAsset = item
end function

function onCurrentFocusedChildChanged(_) as void
    if m.focused = false and m.top.hasFocus()
        m.rowList.setFocus(true)
        m.focused = true
    else if m.focused = true and not m.top.hasFocus() and not m.top.isInFocusChain()
        m.focused = false
    end if
end function
