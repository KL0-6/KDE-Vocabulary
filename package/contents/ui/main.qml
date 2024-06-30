import QtQuick 2.0
import QtQuick.Layouts 1.0

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

import "../api/api.js" as API

Item 
{
    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation;

    Plasmoid.fullRepresentation: Item 
    {
        Layout.minimumWidth: PlasmaCore.Units.gridUnit * 10;
        Layout.preferredWidth: PlasmaCore.Units.gridUnit * 10;

        Layout.minimumHeight: layout.implicitHeight;
        Layout.preferredHeight: layout.implicitHeight;

        function generate_word()
        {
            const word = API.random_word();
            const word_information = API.define_word(word);

            word_label.text = "<h1 style=\"font-size:15px;\">" + word + "</h1>" 
                + "<p style=\"font-style:italic;\">" + word_information["meanings"][0]["partOfSpeech"] + "</p>"
                + "<p>" + word_information["meanings"][0]["definitions"][0]["definition"] + "</p>";
        }

        ColumnLayout
        {
            id: layout;
            anchors.fill: parent;
            spacing: 2;

            PlasmaComponents.Label 
            {
                id: word_label;
                textFormat: Text.RichText;
                wrapMode: Text.WordWrap;
                Layout.maximumWidth: PlasmaCore.Units.gridUnit * 10;

                text: { "placeholder"; }
                Component.onCompleted: generate_word();
            }
            
            PlasmaComponents.Button 
            {
                id: refresh;
                text: "Refresh";
                onClicked: generate_word();
            }
        }
    }
}