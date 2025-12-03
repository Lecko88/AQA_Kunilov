pragma Singleton

import QtQuick

QtObject {

    property var ageRepeaterModel: {
        "Venus": [
            {iconSet: iconSets["Venus"]["Baby"], name: "Baby"},
            {iconSet: iconSets["Venus"]["Child"], name: "Child"},
            {iconSet: iconSets["Venus"]["Adult"], name: "Adult"},
            {iconSet: iconSets["Venus"]["Senior"], name: "Senior"}
        ],
        "Mars": [
            {iconSet: iconSets["Mars"]["Baby"], name: "Baby"},
            {iconSet: iconSets["Mars"]["Child"], name: "Child"},
            {iconSet: iconSets["Mars"]["Adult"], name: "Adult"},
            {iconSet: iconSets["Mars"]["Senior"], name: "Senior"}
        ]
    }

    property var iconSets: {
        "Venus": {
            "Baby": {
                icon: "icons/baby.svg",
                bgImage: "icons/baby-carriage.svg",
                bgColor: "#FFC0CB"
            },
            "Child": {
                icon: "icons/child-dress.svg",
                bgImage: "icons/futbol.svg",
                bgColor: "#87CEEB"
            },
            "Adult": {
                icon: "icons/person-dress.svg",
                bgImage: "icons/lungs.svg",
                bgColor: "#708090"
            },
            "Senior": {
                icon: "icons/person-cane.svg",
                bgImage: "icons/leaf.svg",
                bgColor: "#DAA520"//I have noticed, that only this picture  has different colors in day and night mode. Will implement if have enough time
            }
        },
        "Mars": {
            "Baby": {
                icon: "icons/baby.svg",
                bgImage: "icons/baby-carriage.svg",
                bgColor: "#FFC0CB"
            },
            "Child": {
                icon: "icons/child.svg",
                bgImage: "icons/futbol.svg",
                bgColor: "#87CEEB"
            },
            "Adult": {
                icon: "icons/person.svg",
                bgImage: "icons/lungs.svg",
                bgColor: "#708090"
            },
            "Senior": {
                icon: "icons/person-cane.svg",
                bgImage: "icons/leaf.svg",
                bgColor: "#DAA520"//I have noticed, that only this picture  has different colors in day and night mode. Will implement if have enough time
            }
        }
    }
}
