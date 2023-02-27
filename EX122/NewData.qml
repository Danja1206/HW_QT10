import QtQuick 2.0
import QtQuick.Controls 2.5
Rectangle {
color: '#eeeee4'
width: 500
height: 300
id:mainrect
Text {
x:10
y:10
text: qsTr("Имя задачи")
}
Rectangle
{
color: 'white'
x: jobName.x
y: jobName.y
width: jobName.width
height: jobName.height
}
TextField{
    id:jobName
    y:10
    x:100
    width: 400
    focus: true;
    height: 25
    validator: RegExpValidator { regExp: "^[a-zA-Z]+$" }
    onTextChanged: acceptableInput ? statusLine.text = qsTr("Ввод допущен") : statusLine.text = qsTr("Ввод не допущен")
}

Text {
    id: statusLine
}

Text {
    x:10
    y:40
    text: qsTr("Дата")
}
Rectangle
{
color: 'white'
x: flick.x
y: flick.y
width: flick.width
height: flick.height
}
Flickable {
    id:flick
    x:100
    y:40
    width: 400
    height: 25
    TextField.flickable: TextField {
        id: date
        width: flick.width
        height: flick.height

        focus: true;
        wrapMode: TextEdit.Wrap
        selectByMouse: true
        validator: RegExpValidator { regExp: "[0-9]{2}/[0-9]{2}/[0-9]{4}" }
        onTextChanged: acceptableInput ? statusLine.text = qsTr("Ввод допущен") : statusLine.text = qsTr("Ввод не допущен")
        //RegExpValidator: "[0-9]{2}/[0-9]{2}/[0-9]{4}"
    }
}
Rectangle
{
color: 'white'
x: progressJob.x
y: progressJob.y
width: progressJob.width
height: progressJob.height
}
TextField{
    id:progressJob
    y:70
    x:100
    width: 400
    focus: true;
    height: 25
    validator: IntValidator {bottom: 0; top: 10;}
        onTextChanged: acceptableInput ? statusLine.text = qsTr("Ввод допущен") : statusLine.text = qsTr("Ввод не допущен")
}
Text {
    x:10
    y:70
    text: qsTr("Прогресс")
}
Button {
    id:addData
    text: qsTr("Добавить")
    onClicked:
    {
        var name = jobName.text
        var dateGet = date.text
        var progress = progressJob.text
        mainrect.parent.add(name,dateGet,progress)
    }
    Component.onCompleted: {
        x = mainrect.width - 100;
        y = mainrect.height - 30;
        width = 100;
        height = 30;
    }
}
}

