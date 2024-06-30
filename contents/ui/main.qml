import QtQuick 2.0
import QtQuick.Layouts 1.0

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

import "../api/api.js" as API

Item 
{
    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation

    Plasmoid.fullRepresentation: Item 
    {
        Layout.minimumWidth: layout.implicitWidth
        Layout.minimumHeight: layout.implicitHeight
        Layout.preferredWidth: layout.implicitWidth * 1.2;
        Layout.preferredHeight: layout.implicitHeight * 2;

        function generate_word()
        {
            const word = API.random_word();
            const word_information = API.define_word(word);

            word_label.text = word;
            word_definition.text = word_information[0]["definitions"][0]["definition"];
        }

        ColumnLayout
        {
            id: layout;
            anchors.fill: parent
            spacing: 1

            PlasmaExtras.Heading 
            { 
                id: title;
                text: "Word of the day"; 
                horizontalAlignment: Text.AlignHCenter
            }

            PlasmaComponents.Label 
            {
                id: word_label
                text: {
                    "placeholder";
                }
                maximumLineCount: 1
                horizontalAlignment: Text.AlignHCenter
            }

            PlasmaComponents.Label 
            {
                id: word_definition
                text: {
                    "placeholder";
                }
                horizontalAlignment: Text.AlignHCenter
            }


            Component.onCompleted: generate_word();
        }
    }
}