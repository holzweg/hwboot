<?php /*

[General]
AllowedTypes[]
AllowedTypes[]=Campaign
AllowedTypes[]=MainStory
AllowedTypes[]=ContentGrid
AllowedTypes[]=Gallery
AllowedTypes[]=Banner
AllowedTypes[]=Video
AllowedTypes[]=TagCloud
AllowedTypes[]=Poll
AllowedTypes[]=ItemList
AllowedTypes[]=FeedReader
AllowedTypes[]=FeedbackForm
AllowedTypes[]=HighlightedItem

[Campaign]
Name=Campaign
NumberOfValidItems=5
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[MainStory]
Name=Main story
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewList[]=highligted
ViewName[default]=Background Image
ViewName[highligted]=Highligted

[ContentGrid]
Name=Content Grid
NumberOfValidItems=8
NumberOfArchivedItems=8
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewList[]=1_column_4_rows
ViewList[]=2_columns_2_rows
ViewList[]=3_columns_1_row
ViewList[]=3_columns_2_rows
ViewList[]=4_columns_1_row
ViewList[]=4_columns_2_rows
ViewName[default]=1 column 2 rows
ViewName[1_column_4_rows]=1 column 4 rows
ViewName[2_columns_2_rows]=2 columns 2 rows
ViewName[3_columns_1_row]=3 columns 1 row
ViewName[3_columns_2_rows]=3 columns 2 rows
ViewName[4_columns_1_row]=4 columns 1 row
ViewName[4_columns_2_rows]=4 columns 2 rows

[Gallery]
Name=Gallery
NumberOfValidItems=8
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[Banner]
Name=Banner
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=disabled
ViewList[]
ViewList[]=default
ViewList[]=code
ViewName[default]=URL
ViewName[code]=Code

[Video]
Name=Video
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[TagCloud]
Name=Tag cloud
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=subtree_node_id
UseBrowseMode[subtree_node_id]=true
ViewList[]
ViewList[]=default
ViewName[default]=Default

[Poll]
Name=Poll
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=poll_node_id
UseBrowseMode[poll_node_id]=true
ViewList[]
ViewList[]=default
ViewName[default]=Default

[ItemList]
Name=Item list
NumberOfValidItems=12
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[FeedReader]
Name=Feed reader
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=source
CustomAttributes[]=limit
CustomAttributes[]=offset
ViewList[]
ViewList[]=default
ViewName[default]=Default

[FeedbackForm]
Name=Feedback Form
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[HighlightedItem]
Name=Highlighted Item
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

*/ ?>
