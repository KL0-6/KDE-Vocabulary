import QtQuick 2.0
import QtQuick.Layouts 1.0

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

import "../api/api.js" as API

Item 
{
    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation;

    Plasmoid.fullRepresentation: Item 
    {
        Layout.minimumWidth: word_label.implicitWidth;
        Layout.minimumHeight: word_label.implicitHeight;
        Layout.preferredWidth: word_label.implicitWidth;
        Layout.preferredHeight: word_label.implicitHeight;

        function generate_word()
        {
            const word = API.random_word();
            const word_information = API.define_word(word);

            console.log(word_information["meanings"][0]["definitions"][0]["definition"]);

            word_label.text = "<h1 style=\"font-size:15px;\">" + word + "</h1>" 
                + "<p style=\"font-style:italic;\">" + word_information["meanings"][0]["partOfSpeech"] + "</p>"
                + "<p>" + word_information["meanings"][0]["definitions"][0]["definition"] + "</p>";
        }

        PlasmaComponents.Label 
        {
            id: word_label;
            anchors.fill: parent;
            textFormat: Text.RichText;
            text: { "placeholder"; }
            Component.onCompleted: generate_word();
        }
    }
}