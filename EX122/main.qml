import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import com.vv.exampleclass 1.0
import QtQuick.Controls 2.5

Window {
id:root // Имя объекта для
// обращения
visible: true
width: 640
height: 480
title: qsTr("Hello World")

property string sc: 'ElementUser{width:600; height:150;'

property string nc: 'NewData{width:600; height:150;}'
property int num: 0
property NewData newData: value
function addThisDate(name, date, progress)
{
loader.writeNewInformation(name, date, progress)
var itog = sc + 'townname:"' + name + '";towninfo:"' + date + '"}'
var el = Qt.createQmlObject(itog, list, "obj" + num++)
}
BaseReader{
id : loader
onInitEnd:
{
if (succeed) // См. объявление сигнала initEnd
// Добавляем компонент для добавления нового города
{
newData = Qt.createQmlObject(nc, list, "objdata")
loader.getNextRecord() // Запрашиваем у класса информацию о городе
} else Qt.quit()
}
onLoadTown: {
var itog = sc + 'townname:"' + name + '";towninfo:"' + date + '"}'
var el = Qt.createQmlObject(itog, list, "obj" + num++)
 loader.getNextRecord()
    }
    }
    ScrollView {
    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
    ScrollBar.vertical.policy: ScrollBar.AlwaysOn
    anchors.fill: parent
    Component.onCompleted: loader.loadBase()
    ColumnLayout {
    id:list
    function add(name, date, progress) {
    root.addThisDate(name, date, progress)
    console.log(name)
    console.log(date)
    console.log(progress)
    }
    }
    }
    }

