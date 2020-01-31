module RadioCard exposing (..)

import Element as E
import Element.Background as BG
import Element.Border as Border
import Element.Font as Font
import Element.Events as Events


lightGray : E.Color
lightGray = 
    E.rgb255 170 179 185

white : E.Color 
white = 
    E.rgb255 255 255 255

lightRed : E.Color 
lightRed = 
    E.rgb255 224 0 22


-- Checkmark
type alias RadiomarkAttrs =
    { dotColor : E.Color
    , bgColor : E.Color
    , borderColor : E.Color
    }

radiomark : RadiomarkAttrs -> E.Element msg
radiomark radiomarkAttrs =
    E.el
        [ BG.color radiomarkAttrs.bgColor
        , E.width (E.px 20)
        , E.height (E.px 20)
        , Border.width 2
        , Border.color radiomarkAttrs.borderColor
        , Border.rounded 10
        ]
    <|
        E.el
            [ E.centerX
            , E.centerY
            , BG.color radiomarkAttrs.dotColor
            , E.width (E.px 10)
            , E.height (E.px 10)
            , Border.rounded 5
            ]
            E.none

radiomarkIdle : E.Element msg 
radiomarkIdle = 
    radiomark 
        { dotColor = white 
        , borderColor = lightGray
        , bgColor = white
        }

radiomarkSelected : E.Element msg
radiomarkSelected = 
    radiomark 
        { dotColor = lightRed 
        , borderColor = lightRed
        , bgColor = white
        }


-- Radio element


toolIcon : E.Element msg
toolIcon =
    E.el
        [ E.width (E.px 50)
        , E.height (E.px 50)
        , BG.image toolImgUrl
        ]
        E.none


toolImgUrl : String
toolImgUrl =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Noun_Project_tools_icon_943586_cc.svg/110px-Noun_Project_tools_icon_943586_cc.svg.png"


radioCard : E.Element msg 
radioCard = 
    E.el [] E.none

--Border.widthEach { bottom = 2, top = 0, left = 0, right = 0 }
myRadioElementIdle : E.Element msg
myRadioElementIdle =
    E.column
        [ E.alignLeft
        , E.width (E.px 150)
        , E.height (E.px 125)
        , E.padding 7
        , BG.color white
        , Border.widthEach { bottom = 2, top = 2, left = 2, right = 2 }
        , Border.color lightGray
        ]
        [ radiomarkIdle
        , E.el
            [ E.centerX
            , E.alignTop
            , E.paddingXY 0 0
            ]
            toolIcon
        , E.el
            [ E.centerX
            , E.alignTop
            , Font.family
                [ Font.typeface "Comic Sans MS"
                , Font.sansSerif
                ]
            ]
            (E.text "Tools")
        ]

myRadioElementSelected : E.Element msg
myRadioElementSelected =
    E.column
        [ E.alignLeft
        , E.width (E.px 150)
        , E.height (E.px 125)
        , E.padding 7
        , BG.color white
        , Border.widthEach { bottom = 2, top = 2, left = 2, right = 2 }
        , Border.color lightRed
        ]
        [ radiomarkSelected
        , E.el
            [ E.centerX
            , E.alignTop
            , E.paddingXY 0 0
            ]
            toolIcon
        , E.el
            [ E.centerX
            , E.alignTop
            , Font.family
                [ Font.typeface "Comic Sans MS"
                , Font.sansSerif
                ]
            ]
            (E.text "Tools")
        ]


view =
    E.wrappedRow
        [ E.spacing 10
        , E.width E.fill

        -- , E.explain Debug.todo
        , E.centerX
        ]
        [ myRadioElementIdle 
        , myRadioElementSelected 
        , myRadioElementIdle 
        , myRadioElementIdle 
        , myRadioElementIdle 
        , myRadioElementIdle 
        ]



main =
    E.layout [] view